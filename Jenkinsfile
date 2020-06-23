pipeline {
  environment {
    registry = "chejuro/myfirsrepo"
    registryCredential = ‘chejuro’
  }
  agent any
      stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
