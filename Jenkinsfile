pipeline{
   agent any
   tools{nodejs "node"}
   stages{
      stage('Checkout'){
         steps{
            git url:'https://github.com/nagaraj6618/poc-app.git',branch:'main'
         }
      }
      stage('Install Dependencies'){
         steps{
            bat 'npm install'
         }
      }
      stage('Build Project'){
         steps{
            bat 'npm run build'
         }
      }
   }
   post {
      success {
         echo 'completed successfully!'
      }
      failure {
         echo 'Deployment failed.'
      }
   }
}
