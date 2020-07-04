pipeline {
  parameters {
    password (name: 'jenkins-aws-secret-key-id')
    password (name: 'jenkins-aws-secret-access-key')
  }
  environment {
    TF_WORKSPACE = 'dev' //Sets the Terraform Workspace
    TF_IN_AUTOMATION = 'true'
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
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
         sh "mkdir .aws/credentials"
         sh 'echo $AWS_ACCESS_KEY_ID  | base64 -d > $HOME/.aws/credentials/serviceaccount.json' 
         sh 'echo $AWS_SECRET_ACCESS_KEY | base64 -d >> $HOME/.aws/credentials/serviceaccount.json'
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
