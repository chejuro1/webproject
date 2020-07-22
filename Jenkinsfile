pipeline {
  
   agent { node { label 'project1' } }
  environment {
    TF_WORKSPACE = 'dev' //Sets the Terraform Workspace
    TF_IN_AUTOMATION = 'true'
   
   //AWS_ACCESS_KEY_ID=credentials('access_key')
   //AWS_SECRET_ACCESS_KEY=credentials('secret_key')
    
    
  }
  
  
  stages {
    
    stage('Checkout') {
      steps {
        checkout scm
       
      }
    }
    stage('Terraform Init') {
      
     environment {
          TOOL = tool name: 'terraform', type: 'terraform'
           
                   }
      
      steps {
       
        sh  "terraform init -input=false"
      }
    }
    stage('Terraform Plan') {
      
     
      steps {
        
        
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
