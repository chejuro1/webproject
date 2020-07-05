
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
               //sh 'sudo dpkg --configure -a '
            }
        }
         stage('approval'){
        steps{ 
          script {
          def userInput = input(id: 'confirm', message: 'Apply ansible?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply ansible', name: 'confirm'] ])
            }
             }
          }
        stage('Test') {
            steps {
               // sh 'sudo dpkg --configure -a '
               sh "ansible-playbook -i inventory.ini  verify-host.yml "
            }
        }
        stage('Deploy') {
            steps {
              sh "printenv"
            }
        }
    }
}
