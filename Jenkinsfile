pipeline {
  agent {
    node {
      label 'project'
    }

  }
  stages {
    stage('Clone ') {
      steps {
        sh '''rm -rf /workspace
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
        sh 'sudo docker build -t chejuro/myfirsrepo:v11 .'
        cleanWs(cleanWhenSuccess: true, cleanWhenFailure: true, deleteDirs: true)
      }
    }

  }
}