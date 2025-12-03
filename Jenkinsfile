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
      //TF_VAR_ssh_public_key_path = "${WORKSPACE}/ssh_key.pub"
      AWS_REGION = 'us-west-2'
      AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY')
      AWS_SECRET_KEY_ID = credentials('AWS_SECRET_KEY')
      CONF_DIR = './terraform'
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
                        export AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}
                        export AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_KEY_ID}
                        terraform -chdir=${CONF_DIR} init
                        terraform -chdir=${CONF_DIR} plan -var instance_type=${TF_VAR_instance_type} \
                                       -var instance_name=${TF_VAR_instance_name} \
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
              export AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}
              export AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_KEY_ID}
              terraform -chdir=${CONF_DIR} apply tfplan
            """
          }
        }
    }
    
    post {
        always {
            script {
                sh """
                    rm -f ${WORKSPACE}/tfplan
                    rm -f ${WORKSPACE}/ssh_key.pub
                    unset AWS_ACCESS_KEY_ID
                    unset AWS_SECRET_ACCESS_KEY
                """
            }
        }
    }
}
