pipeline {
    agent any
    
    parameters {
      choice(name: 'INSTANCE_TYPE', choices: ['t3.micro', 't3.small', 't3.medium'], description: 'Тип инстанса EC2')
      string(name: 'INSTANCE_NAME', defaultValue: 'ec2-server', description: 'Имя инстанса')
      booleanParam(name: 'AUTO_APPLY', defaultValue: false)
    }
  
    environment {
      TF_VAR_instance_type = "${params.INSTANCE_TYPE}"
      TF_VAR_instance_name = "${params.INSTANCE_NAME}"
      TF_VAR_ssh_public_key_path = "${params.SSH_KEY_PATH}"
      AWS_REGION = 'us-west-2'
      AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY')
      AWS_SECRET_KEY_ID = credentials('AWS_SECRET_KEY')
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    sh """
                        terraform init
                        terraform plan -var="instances.server.instance_type=${TF_VAR_instance_type}" \
                                       -var="instances.server.name=${TF_VAR_instance_name}" \
                                       -var="instances.server.ssh_public_key_path=${TF_VAR_ssh_public_key_path} \
                                       -out=tfplan
                    """
                }
            }
        }
        
        stage('Terraform Apply') {
          when {
            expression { return params.AUTO_APPLY }
          }
          steps {
            sh """
              terraform apply tfplan
              rm -f tfplan
            """
          }
        }
    }
}
