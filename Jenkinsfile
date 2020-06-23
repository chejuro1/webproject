pipeline {
  agent {
    node {
      label 'project'
    }

  }
  stages {
    stage('Build images') {
      agent {
        node {
          label 'project'
        }

      }
      environment {
        chejuro = 'jpo45l..'
      }
      steps {
        sh 'sudo docker build -t chejuro/myfirsrepo:v11 .'
        cleanWs(cleanWhenSuccess: true, cleanWhenFailure: true, deleteDirs: true)
        sh ''' 
sudo docker push  chejuro/myfirsrepo:v10'''
      }
    }

  }
  environment {
    user = 'chejuro'
    pass = 'jpo45l..'
  }
}