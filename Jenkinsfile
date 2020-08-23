pipeline {
  
   agent { node { label 'project' } }
  environment {
    TF_WORKSPACE = 'dev' //Sets the Terraform Workspace
    TF_IN_AUTOMATION = 'true'
   
 
    
    
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
         container('terraform') {
           sh 'terraform init'
           sh 'terraform plan -out myplan'
         }
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
