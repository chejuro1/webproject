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
      steps {
        sh "/home/jenkins/terraform init -input=false"
      }
    }
    stage('Terraform Plan') {
      steps {
        sh "/home/jenkins/terraform plan -out=tfplan -input=false -var-file='dev.tfvars'"
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
