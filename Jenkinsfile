pipeline {
  agent {
    node {
      label 'project'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh '''sudo docker build . -t chejuro/myfirsrepo:v10

'''
      }
    }

  }
}