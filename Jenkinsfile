
  pipeline {
    
     environment {
    PROJECT = "webproject"
    APP_NAME = "webproject"
    //FE_SVC_NAME = "${APP_NAME}-frontend"
    CLUSTER = "kubernetes"
    //CLUSTER_ZONE = "us-east1-d"
    IMAGE_TAG = "chejuro/myfirsrepo:v12"
    JENKINS_CRED = "${mykubernetescluster}"
  }
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
      stage('approval'){
        steps{ 
          script {
          def userInput = input(id: 'confirm', message: 'Apply Helm?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply Helm', name: 'confirm'] ])
        }
        }
      }
        stage('deploy') {
          parallel {
            stage('pull image'){
            steps {
              withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: 'kubernetes-admin@kubernetes', credentialsId: 'mykubernetescluster', namespace: 'jenkins', serverUrl: 'https://172.31.13.238:6443') {
               sh 'kubectl get namespaces'
                sh 'helm create webproject'
}
                }
        }
      stage('helm deploy') {
            
            steps {
               sh 'printenv'
                }
        }
          }
        }
      }
}
