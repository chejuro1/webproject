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
      steps {
        sh 'sudo docker build -t chejuro/myfirsrepo:v11 .'
        cleanWs(cleanWhenSuccess: true, cleanWhenFailure: true, deleteDirs: true)
      }
    }

  }
}