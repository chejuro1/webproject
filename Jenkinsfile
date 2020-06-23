pipeline {
  environment {
    registry = "chejuro/myfirsrepo"
    registryCredential = "dockerhub"
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git branch: 'master, url: 'https://github.com/chejuro1/webproject.git', credentialsId: '094fb773-1039-46c7-9ac8-5bf558753660'
        
       
      }
    }
    stage('Building image') {
      steps{
        script {
         sudo docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
