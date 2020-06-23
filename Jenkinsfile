pipeline {
  environment {
    registry = "chejuro/myfirsrepo"
    registryCredential = "dockerhub"
  }
  agent any
  stages {
    stage('Cloning Git') {
      git branch: 'master', credentialsId: '094fb773-1039-46c7-9ac8-5bf558753660', url: 'https://github.com/chejuro1/webproject.git'
      steps {
        git 'https://github.com/chejuro1/webproject.git'
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
