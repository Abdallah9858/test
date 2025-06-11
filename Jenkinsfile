pipeline {
    agent any

    environment {
        IMAGE_NAME = "test-image"
        CONTAINER_NAME = "test-container"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code..."
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                script {
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                echo "Stopping and removing old container (if exists)..."
                script {
                    sh """
                        if [ \$(docker ps -aq -f name=${CONTAINER_NAME}) ]; then
                            docker rm -f ${CONTAINER_NAME}
                        fi
                    """
                }
            }
        }

        stage('Run New Container') {
            steps {
                echo "Starting new container..."
                script {
                    sh "docker run -d --name ${CONTAINER_NAME} ${IMAGE_NAME}:latest"
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                echo "Verifying that the container is running..."
                script {
                    sh "docker ps | grep ${CONTAINER_NAME}"
                }
            }
        }
    }

    post {
        failure {
            echo "Pipeline failed. Check logs for details."
        }
        success {
            echo "Deployment successful!"
        }
    }
}
