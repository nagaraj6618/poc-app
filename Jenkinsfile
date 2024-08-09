pipeline{
   agent any
   tools{nodejs "NodeJS"} 
   stages{
      
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
