# AWS Provider Configuration
provider "aws" {
  region = var.region
}

# S3 Bucket Resource
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags   = var.tags

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true # Versioning enabled by default for recovery purposes
  }

  lifecycle_rule {
    id      = "default-lifecycle"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 365
    }
  }
}

# S3 Bucket Policy Resource
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.bucket
  policy = var.bucket_policy
}

# Outputs
output "bucket_details" {
  value = {
    bucket_name = aws_s3_bucket.s3_bucket.bucket
    bucket_arn  = aws_s3_bucket.s3_bucket.arn
  }
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
