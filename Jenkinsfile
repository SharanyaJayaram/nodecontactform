pipeline {
//   environment {
//     def sonarScanner = tool name: 'shasonar' , type: 'hudson.plugins.sonar.SonarRunnerInstallation'
//     imagename = "sharanyajayaram/bankdocker"
//     dockerImage = ''
//   }
  agent any
  stages {
    stage('Code checkout') {
      steps {
        checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SharanyaJayaram/nodecontactform.git']])
      }
    }
