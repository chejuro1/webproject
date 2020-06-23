pipeline {
  environment {
    registry = "chejuro/myfirsrepo"
    registryCredential = "chejuro"
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
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
