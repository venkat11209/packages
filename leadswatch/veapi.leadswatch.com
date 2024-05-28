pipeline {
    agent any
    
    tools {go "goV1.19"}
    
    stages {
        stage('BUILD START MAIL NOTIFICATION') {
            
            steps {
                script {
                    echo "BUILD START MAIL NOTIFICATION Stage 'Starting...'"
					DEFAULT_MAILS="venkateswarlu.p@fission.it,venkataramana@fission.it"
                    emailext (
                        subject: "${currentBuild.fullDisplayName}: Build-STARTED",
                        body: "A new build has started for ${currentBuild.fullDisplayName}",
                        to: "$DEFAULT_MAILS,shirisha.muthyala@fission.it," // Add cloud team and code push to git recipient's email address here
                        )
                    echo "Build start Mail notification sent to reciepients 'SUCCESSFULLY'"
                    echo "BUILD START MAIL NOTIFICATION Stage has'PASS'"
                }
            }
        }
        
        stage('CLONING GIT') {
            steps {
                echo "CLONING GIT Stage 'starting....'"
                git branch: 'dev', credentialsId: 'Github_sshkey', url: 'git@github.com:fissioninfotech/leadswatch-veapi.git'
                echo "CLONING GIT Stage has 'PASS'"
            }
        }
		stage('INSTALL DEPENDENCIES') {
            steps {
                echo "INSTALL DEPENDENCIES Stage 'Starting....'"
				sh 'go build -o veapi.leadswatch.com'
				echo "INSTALL DEPENDENCIES Stage has 'PASS'"
				}
        }
        stage('DEPLOY') {
            steps {
                echo "DEPLOY Stage 'Starting....'"
        	    sh "rsync --rsh='ssh -p5467' -a ${WORKSPACE}/* root@103.170.86.61:/var/www/html/leadswatch-veapi/"
                sh "rsync --rsh='ssh -p5467' -a ${WORKSPACE}/.env root@103.170.86.61:/var/www/html/leadswatch-veapi/"
                sh "rsync --rsh='ssh -p5467' -a ${WORKSPACE}/* root@103.170.86.62:/var/www/html/leadswatch-veapi/"
                sh "rsync --rsh='ssh -p5467' -a ${WORKSPACE}/.env root@103.170.86.62:/var/www/html/leadswatch-veapi/"
                sh "rsync --rsh='ssh -p5467' -a ${WORKSPACE}/* root@103.170.86.63:/var/www/html/leadswatch-veapi/"
                sh "rsync --rsh='ssh -p5467' -a ${WORKSPACE}/.env root@103.170.86.63:/var/www/html/leadswatch-veapi/"
                echo "DEPLOY Stage has 'PASS'"
                
				}
        }
        stage('PM2 RESTART') {
            steps {
                echo "PM2 RESTART Stage 'Starting....'"
	            sh 'ssh -p5467 root@103.170.86.61 "pm2 restart 1"'
                sh 'ssh -p5467 root@103.170.86.62 "pm2 restart 1"'
                sh 'ssh -p5467 root@103.170.86.63 "pm2 restart 1"'
                echo "PM2 RESTART Stage has 'PASS'"
            }
        }
        stage('CLEANWORKSPACE') {
            steps {
                echo "CLEANWORKSPACE Stage 'Starting....'"
			    cleanWs()
			    echo "CLEANWORKSPACE Stage has 'PASS'"
            }
        }
    }
    post {
        // Send email to specific recipient with log attachment
        failure {
            echo 'Email Notification'
            emailext body: '$DEFAULT_CONTENT\nBuild log attached.find the error by bellow attached log',
            // recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
            replyTo: '$DEFAULT_REPLYTO',
            subject: "${currentBuild.fullDisplayName}: Build-FAIL",
            attachLog: true,
		to: '$DEFAULT_RECIPIENTS,shirisha.muthyala@fission.it,'
		      }
		      
		success {
             // Send email to specific recipient without log attachment
            echo 'Email Notification'
            emailext body: '$DEFAULT_CONTENT',
            // recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
            replyTo: '$DEFAULT_REPLYTO',
            subject: "${currentBuild.fullDisplayName}: Build-SUCCESS",
		to: '$DEFAULT_RECIPIENTS,shirisha.muthyala@fission.it,'
		      }
        }
}
