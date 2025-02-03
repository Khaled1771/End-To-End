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
        IMAGE_NAME = 'khaledmahmoud7/java-app'
        IMAGE_TAG = 'latest'
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
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }

        stage("Ansible With Docker") {
            steps{
                sh "ansible-playbook -i DevOps/Ansible/inventory DevOps/Ansible/docker.yml --extra-vars 'docker_image=${IMAGE_NAME} docker_tag=${IMAGE_TAG}'"
            }
        }

        // stage("Ansible With Kubernetes") {
        //     steps{
        //         sh "ansible-playbook -i DevOps/Ansible/inventory DevOps/Ansible/kubernetes_deployment.yml"
        //     }
        // }

    } 
        
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
        always {
            sh 'docker logout'
        }
    }
}