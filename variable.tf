variable "bucket-name" {

  description = "name of the bucket"
  type        = string

}

variable "region" {

  description = "aws region for the bucket"
  type        = string

}

variable "tags" {

  description = "tags for the s3 bucket"
  type        = map(string)

  default = {
    "name" = "value"
  }

}

variable "bucket_policy" {

  description = "JSON bucket policy"
  type        = string

}

variable "wk_data_classification" {
  description = "Data classification (e.g., restricted)"
  type        = string
}

variable "wk_resource_name" {
  description = "Resource name (e.g., gsd-ea-sapbackbone-backup1)"
  type        = string
}

variable "wk_division_code" {
  description = "Division code (e.g., d007)"
  type        = string
}

variable "wk_app_support_group" {
  description = "App support group (e.g., gbs_es_app_support)"
  type        = string
}

variable "wk_bu_code" {
  description = "BU code (e.g., b041)"
  type        = string
}

variable "wk_business_owner" {
  description = "Business owner email (e.g., satish.vellanki@wolterskluwer.com)"
  type        = string
}

variable "wk_requestor" {
  description = "Requestor email (e.g., mark.chlan@wolterskluwer.com)"
  type        = string
}

variable "map_migrated" {
  description = "Migrated map (e.g., mig0SUXNUWWVF)"
  type        = string
}

variable "wk_environment_type" {
  description = "Environment type (e.g., nonprod)"
  type        = string
}

variable "wk_technical_owner" {
  description = "Technical owner email (e.g., mark.chlan@wolterskluwer.com)"
  type        = string
}

variable "resourcecount" {
  description = "Resource count (e.g., yes)"
  type        = string
}

variable "wk_application_name" {
  description = "Application name (e.g., sap ecc 6.0 backbone)"
  type        = string
}

variable "wk_application_bit_id" {
  description = "Application bit ID (e.g., 041800000PB1)"
  type        = string
}

variable "wk_environment_name" {
  description = "Environment name (e.g., dev)"
  type        = string
}

variable "wk_patch_class" {
  description = "Patch class (e.g., manual)"
  type        = string
}

variable "wk_infra_support_group" {
  description = "Infra support group (e.g., wk_na_gbs_aws_systemsupport infrastructure)"
  type        = string
}

#create s3 bucket


resource "aws_s3_bucket" "s3_bucket" {

  bucket = var.bucket-name

  tags = var.tags

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = false
  }
}
#attach bucket policy

resource "aws_s3_bucket_policy" "bucket_policy" {

  bucket = aws_s3_bucket.s3_bucket
  policy = var.bucket_policy

}

#output bucket details


output "bucket_name" {
  value = aws_s3_bucket.s3_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.s3_bucket.arn
}

output "user_inputs" {
  value = {
    wk_data_classification = var.wk_data_classification
    wk_resource_name       = var.wk_resource_name
    wk_division_code       = var.wk_division_code
    wk_app_support_group   = var.wk_app_support_group
    wk_bu_code             = var.wk_bu_code
    wk_business_owner      = var.wk_business_owner
    wk_requestor           = var.wk_requestor
    map_migrated           = var.map_migrated
    wk_environment_type    = var.wk_environment_type
    wk_technical_owner     = var.wk_technical_owner
    resourcecount          = var.resourcecount
    wk_application_name    = var.wk_application_name
    wk_application_bit_id  = var.wk_application_bit_id
    wk_environment_name    = var.wk_environment_name
    wk_patch_class         = var.wk_patch_class
    wk_infra_support_group = var.wk_infra_support_group
  }
}



