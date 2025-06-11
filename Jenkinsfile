pipeline {
    agent any

    environment {
        IMAGE_NAME = "test"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/Abdallah9858/test.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run --rm ${IMAGE_NAME}"
                }
            }
        }
    }
}

