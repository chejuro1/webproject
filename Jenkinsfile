pipeline {
  agent {
    node {
      label 'project'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh '''git clone https://github.com/chejuro1/webproject.git
docker build . -t chejuro/myfirsrepo:${env.BUILD_ID} 

'''
      }
    }

  }
  environment {
    project = 'webproject'
  }
}