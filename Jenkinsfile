
  pipeline {
    agent any
   
    stages {
        stage('checkout') {
            steps {
                git credentialsId: '094fb773-1039-46c7-9ac8-5bf558753660', url: 'https://github.com/chejuro1/webproject.git'
            }
        }
        stage('docker build') {
            steps {
              sh label: '', script: '''sudo docker build -t chejuro/myfirsrepo:v12 .

'''
            }
        }
        stage('Push image to docker hub') {
            
          
            steps {
              sh "sudo chown root:jenkins /run/docker.sock"
           withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
      // following commands will be executed within logged docker registry
         sh 'sudo docker push chejuro/myfirsrepo:v12'
   }
}
        }
      
         }
}
