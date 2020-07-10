
pipeline {
    agent { node { label 'project' } }

    stages {
        stage('ansible') {
          environment {
                 TOOL = tool name: 'Ansible', type: 'org.jenkinsci.plugins.ansible.AnsibleInstallation'
                           }
            steps {
              
             
                sh 'ansible all -m ping -u root'
                sh 'ansible-playbook -i inventory.ini playbook.yml --syntax-check'
                 
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
                
               sh "ansible-playbook -i inventory.ini  playbook.yml "
            }
        }
        stage('Deploy') {
            steps {
              sh "printenv"
            }
        }
    }
}
