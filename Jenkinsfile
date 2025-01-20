pipeline {
    agent any

    parameters {
        string(name: 'TF_VAR_bucket_name', defaultValue: '', description: 'S3 Bucket Name')
        string(name: 'TF_VAR_region', defaultValue: 'us-east-1', description: 'AWS Region')
        string(name: 'TF_VAR_tags', defaultValue: '{"Environment":"dev", "Owner":"DefaultOwner"}', description: 'S3 Bucket Tags (JSON format)')
        string(name: 'TF_VAR_wk_data_classification', defaultValue: 'restricted', description: 'Data Classification')
        string(name: 'TF_VAR_wk_resource_name', defaultValue: 'gsd-ea-sapbackbone-backup1', description: 'Resource Name')
        string(name: 'TF_VAR_wk_division_code', defaultValue: 'd007', description: 'Division Code')
        string(name: 'TF_VAR_wk_app_support_group', defaultValue: 'gbs_es_app_support', description: 'App Support Group')
        string(name: 'TF_VAR_wk_bu_code', defaultValue: 'b041', description: 'BU Code')
        string(name: 'TF_VAR_wk_business_owner', defaultValue: 'example@domain.com', description: 'Business Owner Email')
        string(name: 'TF_VAR_wk_requestor', defaultValue: 'requestor@domain.com', description: 'Requestor Email')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY') // Use Jenkins credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_KEY') // Use Jenkins credentials ID
    }

    stages {
        stage('Initialize Terraform') {
            steps {
                git branch: 'main', url: 'https://github.com/<your-repo>.git' // Update with your repo
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan \
                    -var "bucket-name=${params.TF_VAR_bucket_name}" \
                    -var "region=${params.TF_VAR_region}" \
                    -var "tags=${params.TF_VAR_tags}" \
                    -var "wk_data_classification=${params.TF_VAR_wk_data_classification}" \
                    -var "wk_resource_name=${params.TF_VAR_wk_resource_name}" \
                    -var "wk_division_code=${params.TF_VAR_wk_division_code}" \
                    -var "wk_app_support_group=${params.TF_VAR_wk_app_support_group}" \
                    -var "wk_bu_code=${params.TF_VAR_wk_bu_code}" \
                    -var "wk_business_owner=${params.TF_VAR_wk_business_owner}" \
                    -var "wk_requestor=${params.TF_VAR_wk_requestor}"
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                terraform apply \
                    -var "bucket-name=${params.TF_VAR_bucket_name}" \
                    -var "region=${params.TF_VAR_region}" \
                    -var "tags=${params.TF_VAR_tags}" \
                    -var "wk_data_classification=${params.TF_VAR_wk_data_classification}" \
                    -var "wk_resource_name=${params.TF_VAR_wk_resource_name}" \
                    -var "wk_division_code=${params.TF_VAR_wk_division_code}" \
                    -var "wk_app_support_group=${params.TF_VAR_wk_app_support_group}" \
                    -var "wk_bu_code=${params.TF_VAR_wk_bu_code}" \
                    -var "wk_business_owner=${params.TF_VAR_wk_business_owner}" \
                    -var "wk_requestor=${params.TF_VAR_wk_requestor}" \
                    -auto-approve
                '''
            }
        }
    }

    post {
        success {
            echo 'Terraform S3 Bucket Deployment Successful!'
        }
        failure {
            echo 'Terraform Deployment Failed!'
        }
    }
}
