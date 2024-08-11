pipeline{
   agent any
   tools{nodejs "NodeJS"} 
   stages{
      stage('Checkout'){
         steps{
            git url:'https://github.com/nagaraj6618/poc-app.git', branch:'main' 
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
         },
         steps{
            bat 'xcopy "C:/ProgramData/Jenkins/.jenkins/workspace/poc/build" "C:/React-Build/poc/deploy" /E /I'
         }
      }
      // stage('')
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
