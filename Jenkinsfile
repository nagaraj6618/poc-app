pipeline {
    agent any
    tools { nodejs "NodeJS" } 

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/nagaraj6618/poc-app.git', branch: 'main'
            }
        }
        
        stage('Deploy with Terraform') {
            steps {
                script {
                    dir('terraform') {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
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
