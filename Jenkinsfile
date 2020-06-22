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
        sh 'docker login -u  $chejuro -p $pass '
      }
    }

  }
  environment {
    user = 'chejuro'
    pass = 'jpo45l..'
  }
}