pipeline {
    agent any

    tools {
        jdk 'JDK21'
        maven 'Maven'
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

    }

    post {
        always {
            cleanWs()
        }
    }
}