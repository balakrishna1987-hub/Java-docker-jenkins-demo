pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "simple-java-app"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/balakrishna1987-hub/Java-docker-jenkins-demo' 
            }
        }

        stage('Build Maven Project') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the image to Docker Hub (optional)
                    sh "docker tag ${DOCKER_IMAGE} yourdockerhubusername/${DOCKER_IMAGE}:latest"
                    sh "docker push yourdockerhubusername/${DOCKER_IMAGE}:latest"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Run the Docker container
                    sh "docker run -d -p 8080:8080 ${DOCKER_IMAGE}"
                }
            }
        }
    }
}

