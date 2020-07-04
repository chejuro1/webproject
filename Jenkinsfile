pipeline {
  
  environment {
    TF_WORKSPACE = 'dev' //Sets the Terraform Workspace
    TF_IN_AUTOMATION = 'true'
     AWS_ACCESS_KEY_ID  = credentials('jenkins-aws-secret-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
  }
  agent any 
  
  stages {
    stage('Terraform Init') {
      
      environment {
            TOOL = tool name: 'terraform', type: 'terraform'
           
                   }
      
      steps {
        sh "/home/jenkins/terraform init -input=false"
      }
    }
    stage('Terraform Plan') {
      steps {
        
       sh "export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"
        sh "export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"
         sh "export AWS_DEFAULT_REGION="us-east-2""
        sh "/home/jenkins/terraform plan -out=tfplan -input=false "
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
        sh "${env.TERRAFORM_HOME}/terraform apply -input=false tfplan"
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
