pipeline {
environment {
     imagename = "sharanya000/jenkins-00"
     dockerImage = ''
   }
  agent jenkinsSlave
     options { 
        timestamps ()
        timeout(time: 5, unit: 'MINUTES')   
        skipDefaultCheckout true
        buildDiscarder(logRotator(numToKeepStr: '2'))
    }
  stages {
    stage('Code checkout') {
      steps {
        checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'f0ea83eb-e3e4-47bf-b911-df947eba7be9', url: 'https://github.com/SharanyaJayaram/nodecontactform.git']])
      }
    }
     stage('Build Code'){
      steps{
        script{
               sh "npm install --save express body-parser express-handlebars nodemailer"
              
        }
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
     stage('Select Environment to Deploy') {
          steps {
               script {
                env.selected_environment = input  message: 'Select environment to Deploy',ok : 'Proceed',id :'tag_id',
                parameters:[choice(choices: ['DEV', 'QA', 'STAGING', 'PROD'], description: 'Select environment', name: 'env')]
                echo "Deploying in ${env.selected_environment}."
                }
            }
        }
    stage('Deploy Image') {
      steps{

          withCredentials([usernamePassword(credentialsId: 'dockerid', passwordVariable: 'dockeridPassword', usernameVariable: 'dockeridUser')]) {
            sh "docker login -u ${env.dockeridUser} -p ${env.dockeridPassword}"
            sh 'docker push sharanya000/jenkins-00:latest'
            
          }



      }
    }
  }
     post { 
          always { 
               echo 'Image was pushed successfully to dockerhub '
          }
     }
  }
