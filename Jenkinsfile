pipeline {
environment {
//      def sonarScanner = tool name: 'shasonar' , type: 'hudson.plugins.sonar.SonarRunnerInstallation'
     imagename = "sharanyajayaram/emailtest"
     dockerImage = ''
   }
  agent any
     options { 
        timestamps ()
        timeout(time: 5, unit: 'MINUTES')   
        skipDefaultCheckout true
        buildDiscarder(logRotator(numToKeepStr: '2'))
    }
  stages {
    stage('Code checkout') {
      steps {
        checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '6f909e92-42df-492b-9970-dab57cfc704b', url: 'https://github.com/SharanyaJayaram/nodecontactform.git']])
      }
    }
     stage('Build Code'){
      steps{
        script{
               sh "npm install --save express body-parser express-handlebars nodemailer"
              
        }
      }
    }
//     stage('Code Scan') {
//     steps {
//       withSonarQubeEnv(installationName: 'shasonar', credentialsId: 'sonarid', envOnly: true) {
//         //withSonarQubeEnv(credentialsId: 'sonarid')  {
//             sh "${sonarScanner}/bin/sonar-scanner -Dsonar.projectKey=develop -Dsonar.sources=. "
//         }
        
//     }
// }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{

          withCredentials([usernamePassword(credentialsId: 'dockerid', passwordVariable: 'dockeridPassword', usernameVariable: 'dockeridUser')]) {
            sh "docker login -u ${env.dockeridUser} -p ${env.dockeridPassword}"
            sh 'docker push sharanyajayaram/emailtest:latest'
            //sh "docker pull sharanyajayaram/bankdocker:latest"
            //sh "docker run -d -t -p 3000:3000 --name boschproject. sharanyajayaram/bankdocker:latest"
          }



      }
    }
  }
}
