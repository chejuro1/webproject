pipeline {
  
  agent {
     kubernetes {
     //cloud 'kubernetes'
     label 'terraform'
     }
  }
  environment {
    TF_WORKSPACE = 'dev' //Sets the Terraform Workspace
    TF_IN_AUTOMATION = 'true'
   
 
    
    
  }
  
  
  stages {
    
    stage('Checkout') {
      steps {
        
       sh ' git branch: 'terraform ', credentialsId: 'Github', url: 'https://github.com/chejuro1/webproject.git'  '
        //checkout scm
       
      }
    }
    stage('Terraform Init') {
      
     environment {
          TOOL = tool name: 'terraform', type: 'terraform'
           
                   }
      
      steps {
        
           sh 'terraform init'
           
       
       }
     }
    
    stage('Terraform Plan') {
      
     
      steps {
        
        sh "pwd "
        sh "terraform plan -out=tfplan -input=false "
      }
    }
    
    stage('approval'){
        steps{ 
          script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply Terraform', name: 'confirm'] ])
            }
             }
          }
    stage('Terraform Apply') {
      steps {
        input 'Apply Plan'
        sh "terraform apply -input=false tfplan"
      }
    }
    stage('AWSpec Tests') {
      steps {
          sh '''#!/bin/bash -l
bundle install --path ~/.gem
bundle exec rake spec || true
'''

        junit(allowEmptyResults: true, testResults: '**/testResults/*.xml')
      }
    }
  }
}
