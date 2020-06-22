pipeline {
  agent {
    node {
      label 'project'
    }

  }
  stages {
    stage('Clone ') {
      steps {
        sh '''
git clone https://github.com/chejuro1/webproject.git


'''
      }
    }

    stage('Build images') {
      steps {
        sh 'docker . -t chejuro/myfirsrepo:v10 '
        cleanWs(cleanWhenSuccess: true, cleanWhenFailure: true)
      }
    }

  }
}