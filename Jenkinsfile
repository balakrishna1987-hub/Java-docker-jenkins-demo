pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url:'https://github.com/balakrishna1987-hub/Java-docker-jenkins-demo.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t simple-springboot .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop simple-springboot || true'
                sh 'docker rm simple-springboot || true'
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d -p 8081:8080 --name simple-springboot simple-springboot'
            }
        }
    }
}

