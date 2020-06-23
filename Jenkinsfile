pipeline {
  environment {
    registry = "chejuro/myfirsrepo"
    registryCredential = "chejuro"
  }
  agent any
   stages {
      stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
