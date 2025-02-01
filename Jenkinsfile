pipeline {
    agent any
    tools {
        maven "M399" 
    }
    environment {
        GIT_REPO = 'https://github.com/Khaled1771/End-To-End-DevOps-Project.git'
        BRANCH = 'main'
        TOMCAT_HOME = '/opt/tomcat'
        EC2_USER = 'ubuntu'  
        //EC2_HOST = '16.24.156.16'  
        //SSH_KEY = '/var/jenkins_home/key/JavaApp.pem'  
        IMAGE_NAME = 'khaledmahmoud7/java-app'
        IMAGE_TAG = '1.0'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
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

        stage("Test") {
            steps{
                sh 'mvn test'
            }
        }

        stage("Dockerized Java-Tomcat") {
            steps{
                sh 'pwd'
                sh 'ls -l'
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

    stage('Push Docker Image') {
            steps {
                // when{
                //         expression{
                //             BRANCH_NAME == 'main'
                //         }
                //     }
                // script {
                //     // Log in to Docker registry (e.g., Docker Hub)
                //     withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                   
                //         sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin "
                //           // Push the Docker image
                //         sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"

                //     }   
                // }
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
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