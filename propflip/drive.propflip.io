pipeline {
    agent any
    
    tools {
		nodejs "nodejs16.16.0"
		}
    
    stages {
        stage('BUILD START MAIL NOTIFICATION') {
            
            steps {
                script {
                    echo "BUILD START MAIL NOTIFICATION Stage 'Starting...'"
					DEFAULT_MAILS="venkateswarlu.p@fission.it,venkataramana@fission.it"
                    emailext (
                        subject: "${currentBuild.fullDisplayName}: Build-STARTED",
                        body: "A new build has started for ${currentBuild.fullDisplayName}",
                        to: "$DEFAULT_MAILS,pavan.kavuturu@fission.it," // Add cloud team and code push to git recipient's email address here
                        )
                    echo "Build start Mail notification sent to reciepients 'SUCCESSFULLY'"
                    echo "BUILD START MAIL NOTIFICATION Stage has'PASS'"
                }
            }
        }
        
        stage('CLONING GIT') {
            steps {
                echo "CLONING GIT Stage 'Starting....'"
        
                checkout(scm: [$class: 'GitSCM', 
                    branches: [[name: 'main']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'CloneOption', shallow: true, depth: 1]], 
                    userRemoteConfigs: [[credentialsId: 'Github_sshkey', url: 'git@github.com:fissioninfotech/drive.propflip.git']]])
            
                echo "CLONING GIT Stage has 'PASS'"
				}
		}
		
		stage('INSTALL DEPENDENCIES') {
            steps {
                echo "INSTALL DEPENDENCIES Stage 'Starting....'"
				sh 'npm install'
				echo "INSTALL DEPENDENCIES Stage has 'PASS'"
				}
        }
        stage('DEPLOY') {
            steps {
			    echo "DEPLOY Stage 'Starting....'"
			    sh "rsync --rsh='ssh -p5456' -a ${WORKSPACE}/* root@103.170.86.77:/var/www/html/propflip-project/drive.propflip.io"
			    sh "rsync --rsh='ssh -p5456' -a ${WORKSPACE}/* root@103.170.86.82:/var/www/html/propflip-project/drive.propflip.io"
		        sh "rsync --rsh='ssh -p5456' -a ${WORKSPACE}/.env root@103.170.86.77:/var/www/html/propflip-project/drive.propflip.io"
			    sh "rsync --rsh='ssh -p5456' -a ${WORKSPACE}/.env root@103.170.86.82:/var/www/html/propflip-project/drive.propflip.io"
			    echo "DEPLOY Stage has 'PASS'"
            }
        }
        stage('PM2 RESTART') {
            steps {
                echo "PM2 RESTART Stage 'Starting....'"
			    sh 'ssh -p5456 root@103.170.86.77 "pm2 restart 2"'
			    sh 'ssh -p5456 root@103.170.86.82 "pm2 restart 2"'
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
		to: '$DEFAULT_RECIPIENTS,pavan.kavuturu@fission.it,'
		      }
		      
		success {
             // Send email to specific recipient without log attachment
            echo 'Email Notification'
            emailext body: '$DEFAULT_CONTENT',
            // recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
            replyTo: '$DEFAULT_REPLYTO',
            subject: "${currentBuild.fullDisplayName}: Build-SUCCESS",
		to: '$DEFAULT_RECIPIENTS,pavan.kavuturu@fission.it,'
		      }
        }    
}
