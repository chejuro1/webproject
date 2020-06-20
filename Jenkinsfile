pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker build . -t  chejuro/myfirsrepo:v10'
      }
    }

    stage('Artifact') {
      steps {
        sh '''docker push 
'''
      }
    }

    stage('helm ') {
      steps {
        sh 'Helm create '
      }
    }

  }
}