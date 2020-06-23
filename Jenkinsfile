pipeline {
  environment {
    registry = "chejuro/myfirsrepo"
    registryCredential = "dockerhub"
    GITHUB_CREDENTIALS = credentials('094fb773-1039-46c7-9ac8-5bf558753660')
  }
  agent any
  stages {
    stage('Cloning Git') {
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
