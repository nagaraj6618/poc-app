pipeline {
    agent any
    tools { nodejs "NodeJS" } 

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/nagaraj6618/poc-app.git', branch: 'main'
            }
        }
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }
        stage('Build Project') {
            steps {
                bat 'npm run build'
            }
        }
        stage('Deploy with Terraform') {
            steps {
                script {
                    dir('terraform') {
                        bat 'terraform init'
                        bat 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
    post {
        success {
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
