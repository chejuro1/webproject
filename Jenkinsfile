pipeline {
  agent {
    node {
      label 'project'
    }

  }
  stages {
    stage('Clone ') {
      parallel {
        stage('Clone ') {
          steps {
            sh '''
git clone https://github.com/chejuro1/webproject.git


'''
          }
        }

        stage('Build images') {
          steps {
            sh '''cd /home/jenkins/workspace/webproject_master
sudo docker build . -t chejuro/myfirsrepo:v10'''
          }
        }

      }
    }

  }
}