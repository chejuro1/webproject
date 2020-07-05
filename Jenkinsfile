
pipeline {
    agent any

    stages {
        stage('ansible') {
          environment {
                 TOOL = tool name: 'ansible', type: 'org.jenkinsci.plugins.ansible.AnsibleInstallation'
                           }
            steps {
              
             
                sh 'ansible all -m ping -u ubuntu'
                sh 'ansible-playbook -i inventory.ini  verify-host.yml --syntax-check'
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
