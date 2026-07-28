pipeline {
    agent any

    tools {
        jdk 'JDK21'
        maven 'Maven'
    }

    environment {
        IMAGE_NAME = "employee-management:1.0"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/kshitijshri99/employee-management-devops.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('OWASP Dependency Check') {
            steps {
                sh '''
                /opt/dependency-check-tool/bin/dependency-check.sh \
                --project EmployeeManagement \
                --scan . \
                --out dependency-check-report
                '''
            }
        }

        stage('Trivy File System Scan') {
            steps {
                sh 'trivy fs .'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Trivy Docker Image Scan') {
            steps {
                sh 'trivy image $IMAGE_NAME'
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop employee-management || true
                docker rm employee-management || true

                docker run -d \
                --name employee-management \
                -p 8080:8080 \
                employee-management:1.0
                '''
            }
        }

    }

    post {
        always {
            cleanWs()
        }
    }
}