pipeline {
    agent any

    tools {
        jdk 'JDK21'
        maven 'Maven'
    }

    environment {
        IMAGE_NAME = "employee-management:1.0"
        CONTAINER_NAME = "employee-management-container"
    }

    options {
        timestamps()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(
            numToKeepStr: '10',
            artifactNumToKeepStr: '10'
        ))
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/kshitijshri99/employee-management-devops.git'
            }
        }

        stage('Build Application') {
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
                sh '''
                docker build -t $IMAGE_NAME .
                '''
            }
        }

        stage('Trivy Docker Image Scan') {
            steps {
                sh '''
                trivy image \
                    --format table \
                    --output trivy-image-report.txt \
                    $IMAGE_NAME
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                echo "Stopping existing container..."

                docker stop $CONTAINER_NAME || true
                docker rm -f $CONTAINER_NAME || true

                echo "Cleaning unused Docker images..."
                docker image prune -f

                echo "Starting new container..."

                docker run -d \
                    --restart unless-stopped \
                    --name $CONTAINER_NAME \
                    -p 8080:8080 \
                    $IMAGE_NAME

                echo "Deployment Successful."
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                echo "Waiting for application..."
                sleep 15

                docker ps

                curl -I http://localhost:8080 || true
                '''
            }
        }
    }

    post {

        success {
            echo "Pipeline completed successfully."
        }

        failure {
            echo "Pipeline failed."
        }

        always {

            archiveArtifacts artifacts: 'trivy-fs-report.txt', allowEmptyArchive: true
            archiveArtifacts artifacts: 'trivy-image-report.txt', allowEmptyArchive: true
            archiveArtifacts artifacts: 'dependency-check-report/**', allowEmptyArchive: true

            cleanWs()
        }
