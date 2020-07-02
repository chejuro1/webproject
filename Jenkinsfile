
pipeline {
    agent any

    stages {
        stage('ansible') {
          environment {
                 TOOL = tool name: 'ansible', type: 'org.jenkinsci.plugins.ansible.AnsibleInstallation'
                           }
            steps {
              
                sh 'printenv'
                
            }
        }
        stage('Test') {
            steps {
               sh ' echo 'Testing..''
            }
        }
        stage('Deploy') {
            steps {
              sh '  echo 'Deploying....''
            }
        }
    }
}
