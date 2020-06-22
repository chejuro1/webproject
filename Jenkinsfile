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
      agent {
        node {
          label 'project'
        }

      }
      steps {
        sh 'docker build -t chejuro/myfirsrepo:v10 .'
        cleanWs(cleanWhenSuccess: true, cleanWhenFailure: true)
      }
    }

  }
}