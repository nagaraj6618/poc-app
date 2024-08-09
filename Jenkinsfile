pipeline{
   agent any
   tools{nodejs "NodeJS"} // Ensure "node" is correctly configured in Jenkins
   stages{
      stage('Checkout'){
         steps{
            git url:'https://github.com/nagaraj6618/poc-app.git', branch:'main' // Ensure correct repository access
         }
      }
      stage('Install Dependencies'){
         steps{
            bat 'npm install' // Ensure running on Windows, use sh 'npm install' for Unix-based agents
         }
      }
      stage('Build Project'){
         steps{
            bat 'npm run build' // Ensure a "build" script is defined in package.json
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
