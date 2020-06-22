pipeline {
  agent {
    node {
      label 'project'
    }

  }
  stages {
    stage('Clone ') {
      steps {
        sh '''rm -rf *.*
git clone https://github.com/chejuro1/webproject.git


'''
      }
    }

  }
}