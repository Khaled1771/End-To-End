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
        EC2_HOST = '15.185.34.115'  
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

        stage("Test..") {
            steps{
                sh 'mvn test'
            }
        }

        stage("Dockerized") {
            steps{
                sh 'cd DevOps/Docker/'
                sh 'docker build -t tomcat-image .'
                sh 'docker run -d --name tomcat-cont -p 8888:8080 tomcat-image'
            }
        }

       /* stage('Deploy to AWS EC2') {
            steps {
                // Copy the WAR file to the EC2 instance  --> Note That: SCP Connection needs Permission                 
                    sh """
                        scp -i ${SSH_KEY} target/webapp.war ${EC2_USER}@${EC2_HOST}:${TOMCAT_HOME}/webapps/
                    """                   
                }
            } */
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