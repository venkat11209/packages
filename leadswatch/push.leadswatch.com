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
                git branch: 'main', credentialsId: 'Github_sshkey', url: 'git@github.com:fissioninfotech/push.leadswatch.com.git'
                echo "CLONING GIT Stage has 'PASS'"
            }
        }
		stage('INSTALL DEPENDENCIES') {
            steps {
                echo "INSTALL DEPENDENCIES Stage 'Starting....'"
				sh 'go build -o push.leadswatch.com'
				echo "INSTALL DEPENDENCIES Stage has 'PASS'"
				}
        }
        stage('DEPLOY') {
            steps {
                echo "DEPLOY Stage 'Starting....'"
                //sh "rsync --rsh='ssh -p22' -a ${WORKSPACE}/* root@64.225.58.0:/var/www/html/push.leadswatch.com/"
                //sh "rsync --rsh='ssh -p22' -a ${WORKSPACE}/.env root@64.225.58.0:/var/www/html/push.leadswatch.com/"
                sh "rsync --rsh='ssh -p5456' -a ${WORKSPACE}/* root@103.170.86.44:/var/www/html/push.leadswatch.com/"
                sh "rsync --rsh='ssh -p5456' -a ${WORKSPACE}/.env root@103.170.86.44:/var/www/html/push.leadswatch.com/"
                sh "rsync --rsh='ssh -p5456' -a ${WORKSPACE}/* root@103.170.86.47:/var/www/html/push.leadswatch.com/"
                sh "rsync --rsh='ssh -p5456' -a ${WORKSPACE}/.env root@103.170.86.47:/var/www/html/push.leadswatch.com/"
                sh "rsync --rsh='ssh -p5467' -a ${WORKSPACE}/* root@103.170.86.57:/var/www/html/push.leadswatch.com/"
                sh "rsync --rsh='ssh -p5467' -a ${WORKSPACE}/.env root@103.170.86.57:/var/www/html/push.leadswatch.com/"
                sh "rsync --rsh='ssh -p5456' -a ${WORKSPACE}/* root@103.170.86.46:/var/www/html/push.leadswatch.com/"
                sh "rsync --rsh='ssh -p5456' -a ${WORKSPACE}/.env root@103.170.86.46:/var/www/html/push.leadswatch.com/"
                sh "rsync --rsh='ssh -p5768' -a ${WORKSPACE}/* root@103.170.86.23:/var/www/html/push.leadswatch.com/"
                sh "rsync --rsh='ssh -p5768' -a ${WORKSPACE}/.env root@103.170.86.23:/var/www/html/push.leadswatch.com/"
                echo "DEPLOY Stage has 'PASS'"
				}
        }
        stage('PM2 RESTART') {
            steps {
                echo "PM2 RESTART Stage 'Starting....'"
                //sh 'ssh -p22 root@64.225.58.0 "pm2 restart 0"'
                sh 'ssh -p5456 root@103.170.86.44 "pm2 restart 0"'
                sh 'ssh -p5456 root@103.170.86.47 "pm2 restart 12"'
                sh 'ssh -p5467 root@103.170.86.57 "pm2 restart 0"'
                sh 'ssh -p5456 root@103.170.86.46 "pm2 restart 0"'
                sh 'ssh -p5768 root@103.170.86.23 "pm2 restart 0"'
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
		to: '$DEFAULT_RECIPIENTS,shirisha.muthyala@fission.it,justin.antony@fission.it,'
		      }
		      
		success {
             // Send email to specific recipient without log attachment
            echo 'Email Notification'
            emailext body: '$DEFAULT_CONTENT',
            // recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
            replyTo: '$DEFAULT_REPLYTO',
            subject: "${currentBuild.fullDisplayName}: Build-SUCCESS",
		to: '$DEFAULT_RECIPIENTS,shirisha.muthyala@fission.it,justin.antony@fission.it,'
		      }
        }
}
