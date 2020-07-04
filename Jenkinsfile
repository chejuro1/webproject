
pipeline {
    agent any

    stages {
        stage('ansible') {
          environment {
                 TOOL = tool name: 'ansible', type: 'org.jenkinsci.plugins.ansible.AnsibleInstallation'
                           }
            steps {
              
             
                sh 'ansible ansible all -m ping -u ubuntu'
                sh 'ansible-galaxy list'
            }
        }
        stage('Test') {
            steps {
               sh "which ansible"
            }
        }
        stage('Deploy') {
            steps {
              sh "printenv"
            }
        }
    }
}
