pipeline {
    agent any
    tools {
        maven "M399" 
    }
    environment {
        GIT_REPO = 'https://github.com/Khaled1771/End-To-End-DevOps-Project.git'
        BRANCH = 'main'
        TOMCAT_HOME = '/opt/tomcat'
        EC2_USER = 'ec2-user'  
        EC2_HOST = '156.207.43.108'  
        SSH_KEY = '/var/jenkins_home/key/dotnet.pem'  
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${BRANCH}", url: "${GIT_REPO}"
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Deploy to AWS EC2') {
            steps {
                // Copy the WAR file to the EC2 instance
                    
                sh """
                    scp -i ${SSH_KEY} target/webapp.war ${EC2_USER}@${EC2_HOST}:${TOMCAT_HOME}/webapps/
                """

                // Restart Tomcat to deploy the new WAR file                   
                //     sh """
                //         ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} '${TOMCAT_HOME}/bin/shutdown.sh'
                //         ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} '${TOMCAT_HOME}/bin/startup.sh'
                //     """
                    
                }
            }
        }
        
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}