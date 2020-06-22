pipeline {
  agent {
    node {
      label 'project'
    }

  }
  stages {
    stage('Clone ') {
      steps {
        sh '''rm -rf /home/jenkins/workspace/*
git clone https://github.com/chejuro1/webproject.git


'''
      }
    }

  }
}