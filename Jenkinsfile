pipeline {
    agent any

    parameters {
        string(name: 'TF_VAR_bucket_name', defaultValue: '', description: 'S3 Bucket Name')
        string(name: 'TF_VAR_region', defaultValue: 'us-east-1', description: 'AWS Region')
        string(name: 'TF_VAR_wk_data_classification', defaultValue: 'restricted', description: 'Data Classification')
        string(name: 'TF_VAR_wk_resource_name', defaultValue: 'gsd-ea-sapbackbone-backup1', description: 'Resource Name')
        string(name: 'TF_VAR_wk_division_code', defaultValue: 'd007', description: 'Division Code')
        string(name: 'TF_VAR_wk_app_support_group', defaultValue: 'gbs_es_app_support', description: 'App Support Group')
        string(name: 'TF_VAR_wk_bu_code', defaultValue: 'b041', description: 'BU Code')
        string(name: 'TF_VAR_wk_business_owner', defaultValue: 'satish.vellanki@wolterskluwer.com', description: 'Business Owner Email')
        string(name: 'TF_VAR_wk_requestor', defaultValue: 'mark.chlan@wolterskluwer.com', description: 'Requestor Email')
        string(name: 'TF_VAR_map_migrated', defaultValue: 'mig0SUXNUWWVF', description: 'Migrated Map')
        string(name: 'TF_VAR_wk_environment_type', defaultValue: 'nonprod', description: 'Environment Type')
        string(name: 'TF_VAR_wk_technical_owner', defaultValue: 'mark.chlan@wolterskluwer.com', description: 'Technical Owner Email')
        string(name: 'TF_VAR_resourcecount', defaultValue: 'yes', description: 'Resource Count')
        string(name: 'TF_VAR_wk_application_name', defaultValue: 'sap ecc 6.0 backbone', description: 'Application Name')
        string(name: 'TF_VAR_wk_application_bit_id', defaultValue: '041800000PB1', description: 'Application Bit ID')
        string(name: 'TF_VAR_wk_environment_name', defaultValue: 'dev', description: 'Environment Name')
        string(name: 'TF_VAR_wk_patch_class', defaultValue: 'manual', description: 'Patch Class')
        string(name: 'TF_VAR_wk_infra_support_group', defaultValue: 'wk_na_gbs_aws_systemsupport infrastructure', description: 'Infra Support Group')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')  // Replace with Jenkins credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') // Replace with Jenkins credentials ID
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/pratikdavange/S3_Bucket.git'  // Replace with your repo URL
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan \
                    -var "bucket-name=${params.TF_VAR_bucket_name}" \
                    -var "region=${params.TF_VAR_region}" \
                    -var "wk_data_classification=${params.TF_VAR_wk_data_classification}" \
                    -var "wk_resource_name=${params.TF_VAR_wk_resource_name}" \
                    -var "wk_division_code=${params.TF_VAR_wk_division_code}" \
                    -var "wk_app_support_group=${params.TF_VAR_wk_app_support_group}" \
                    -var "wk_bu_code=${params.TF_VAR_wk_bu_code}" \
                    -var "wk_business_owner=${params.TF_VAR_wk_business_owner}" \
                    -var "wk_requestor=${params.TF_VAR_wk_requestor}" \
                    -var "map_migrated=${params.TF_VAR_map_migrated}" \
                    -var "wk_environment_type=${params.TF_VAR_wk_environment_type}" \
                    -var "wk_technical_owner=${params.TF_VAR_wk_technical_owner}" \
                    -var "resourcecount=${params.TF_VAR_resourcecount}" \
                    -var "wk_application_name=${params.TF_VAR_wk_application_name}" \
                    -var "wk_application_bit_id=${params.TF_VAR_wk_application_bit_id}" \
                    -var "wk_environment_name=${params.TF_VAR_wk_environment_name}" \
                    -var "wk_patch_class=${params.TF_VAR_wk_patch_class}" \
                    -var "wk_infra_support_group=${params.TF_VAR_wk_infra_support_group}"
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                terraform apply \
                    -var "bucket-name=${params.TF_VAR_bucket_name}" \
                    -var "region=${params.TF_VAR_region}" \
                    -var "wk_data_classification=${params.TF_VAR_wk_data_classification}" \
                    -var "wk_resource_name=${params.TF_VAR_wk_resource_name}" \
                    -var "wk_division_code=${params.TF_VAR_wk_division_code}" \
                    -var "wk_app_support_group=${params.TF_VAR_wk_app_support_group}" \
                    -var "wk_bu_code=${params.TF_VAR_wk_bu_code}" \
                    -var "wk_business_owner=${params.TF_VAR_wk_business_owner}" \
                    -var "wk_requestor=${params.TF_VAR_wk_requestor}" \
                    -var "map_migrated=${params.TF_VAR_map_migrated}" \
                    -var "wk_environment_type=${params.TF_VAR_wk_environment_type}" \
                    -var "wk_technical_owner=${params.TF_VAR_wk_technical_owner}" \
                    -var "resourcecount=${params.TF_VAR_resourcecount}" \
                    -var "wk_application_name=${params.TF_VAR_wk_application_name}" \
                    -var "wk_application_bit_id=${params.TF_VAR_wk_application_bit_id}" \
                    -var "wk_environment_name=${params.TF_VAR_wk_environment_name}" \
                    -var "wk_patch_class=${params.TF_VAR_wk_patch_class}" \
                    -var "wk_infra_support_group=${params.TF_VAR_wk_infra_support_group}" \
                    -auto-approve
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
