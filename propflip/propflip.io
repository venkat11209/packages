pipeline {
    agent any
    
    tools {
		nodejs "nodejs16.20.0"
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
                        to: "$DEFAULT_MAILS,tejdeep.lanka@fission.it," // Add cloud team and code push to git recipient's email address here
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
                    userRemoteConfigs: [[credentialsId: 'Github_sshkey', url: 'git@github.com:fissioninfotech/propflip.io.git']]])
            
                echo "CLONING GIT Stage has 'PASS'"
				}
		}
        
		stage('INSTALL DEPENDENCIES') {
            steps {
                echo "INSTALL DEPENDENCIES Stage 'Starting....'"
				sh 'npm i -g yarn'
				sh 'yarn install'
				sh 'yarn build'
				echo "INSTALL DEPENDENCIES Stage has 'PASS'"
				}
        }
        stage('DEPLOY') {
            steps {
                echo "DEPLOY Stage 'Starting....'"
			 //   sh "rsync --rsh='ssh -p22' -a ${WORKSPACE}/* root@138.197.106.252:/var/www/html/propflip.io"
			    sh 'scp -r build/* root@138.197.106.252:/var/www/html/propflip.io/build'
			    echo "DEPLOY Stage has 'PASS'"
			}
        }
        stage('RESTART NGINX') {
            steps {
                echo "RESTART NGINX Stage 'Starting'"
			    sh 'ssh -p22 root@138.197.106.252 "systemctl restart nginx.service"'
			    echo "RESTART NGINX has 'PASS'"
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
		to: '$DEFAULT_RECIPIENTS,tejdeep.lanka@fission.it,'
		      }
		      
		success {
             // Send email to specific recipient without log attachment
            echo 'Email Notification'
            emailext body: '$DEFAULT_CONTENT',
            // recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
            replyTo: '$DEFAULT_REPLYTO',
            subject: "${currentBuild.fullDisplayName}: Build-SUCCESS",
		to: '$DEFAULT_RECIPIENTS,tejdeep.lanka@fission.it,'
		      }
        }    
}
