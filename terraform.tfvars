bucket_name = "my-bucket-name"
region      = ""
tags = {
  "Environment" = "Production"
  "Owner"       = "DevOps"
}
bucket_policy = jsonencode({
  Version = "2012-10-17"
  Statement = [
    {
      Sid       = "PublicReadGetObject"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "arn:aws:s3:::${var.bucket_name}/*"
    }
  ]
})
wk_data_classification = ""
wk_resource_name       = ""
wk_division_code       = ""
wk_app_support_group   = ""
wk_bu_code             = ""
wk_business_owner      = ""
wk_requestor           = ""
map_migrated           = ""
wk_environment_type    = ""
wk_technical_owner     = ""
resourcecount          = ""
wk_application_name    = ""
wk_application_bit_id  = ""
wk_environment_name    = ""
wk_patch_class         = ""
wk_infra_support_group = ""
