### AWS Variables ###
variable "region" {}
variable "region_wrapper" {}

variable "lambda_retail_parent_role_arn" {
    type = string
}

variable "lambda_retail_child_function_arn"{
    type = string
}

### SFx Variables ###
variable "access_token" {}
variable "realm" {}
variable "metrics_url" {}
variable "metrics_tracing" {}
variable "apm_environment" {}

### Function Names ###
variable "parent_function_name" {}
