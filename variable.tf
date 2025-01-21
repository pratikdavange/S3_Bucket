variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "region" {
  description = "AWS region for the bucket"
  type        = string
}

variable "tags" {
  description = "Tags for the S3 bucket"
  type        = map(string)
  default = {
    "name" = "value"
  }
}

variable "bucket_policy" {
  description = "JSON-formatted bucket policy"
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
