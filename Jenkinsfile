
  pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                git credentialsId: '094fb773-1039-46c7-9ac8-5bf558753660', url: 'https://github.com/chejuro1/webproject.git'
            }
        }
        stage('docker build') {
            steps {
                sh label: '', script: '''def customImage = docker.build("chejuro/myfirsrepo:${env.BUILD_ID}")
'''
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
