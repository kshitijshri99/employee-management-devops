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
                sh '''
                trivy fs \
                --format table \
                --output trivy-fs-report.txt \
                .
                '''
             }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Trivy Docker Image Scan') {
            steps {
                sh '''
                trivy image \
                --format table \
                --output trivy-image-report.txt \
                employee-management:1.0
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker rm -f employee-management-container || true
                docker image prune -f
                docker run -d \     
                --restart unless-stopped \
                --name employee-management-container \
                -p 8080:8080 \
                employee-management:1.0
                '''
            }
        }

    }

    post {
        always {
            archiveArtifacts artifacts: '**/*.txt', allowEmptyArchive: true
            archiveArtifacts artifacts: '**/dependency-check-report/**', allowEmptyArchive: true
            cleanWs()
        }
    }
}