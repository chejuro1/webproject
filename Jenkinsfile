
  pipeline {
    
     environment {
    PROJECT = "webproject"
    APP_NAME = "webproject"
    //FE_SVC_NAME = "${APP_NAME}-frontend"
    CLUSTER = "kubernetes"
    //CLUSTER_ZONE = "us-east1-d"
    IMAGE_TAG = "chejuro/myfirsrepo:v12"
    JENKINS_CRED = "${mykubernetescluster}"
    AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    TF_IN_AUTOMATION      = '1'
  }
    agent any
     parameters {
        string(name: 'environment', defaultValue: 'default', description: 'Workspace/environment file to use for deployment')
        string(name: 'version', defaultValue: '', description: 'Version variable to pass to Terraform')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
     }
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
             stage('kubectl'){
                   steps {
                        withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: 'kubernetes-admin@kubernetes', credentialsId: 'mykubernetescluster', namespace: 'jenkins', serverUrl: 'https://172.31.13.238:6443') {
                        sh 'kubectl get namespaces'
                        //sh 'helm install --debug  ./project  --name project --namespace jenkins '
                                   }
                     }
                              }
             stage('helm deploy') {
            
                   steps {
                         withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: 'kubernetes-admin@kubernetes', credentialsId: 'mykubernetescluster', namespace: 'jenkins', serverUrl: 'https://172.31.13.238:6443') {
                         sh 'kubectl get namespaces'
                        //sh 'helm install --debug  ./project  --name project --namespace jenkins '
                        sh 'helm ls --all '
                 
                              }
                             }
                         }
                stage('ansible') {
                environment {
                 TOOL = tool name: 'ansible', type: 'org.jenkinsci.plugins.ansible.AnsibleInstallation'
                           }
                    steps {
                     sh 'printenv'
                         }
                               }
          
          
          
            
            stage('Terraform deploy') {
             environment {
            TOOL = tool name: 'terraform', type: 'terraform'
           
                   }
           steps {
             withCredentials { Env.AWS_ACCESS_KEY_ID , Env.AWS_SECRET_ACCESS_KEY
              sh "terraform init"
                sh "terraform plan"
                 }
               
                }
                steps {
               sh "terraform apply"
               
                }
        }
            
          
    } 
        
      }
}
