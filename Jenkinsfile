pipeline {
    agent any

    environment {
        IMAGE_NAME = "test"
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

