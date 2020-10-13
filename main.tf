### AWS Auth Configuration ###
provider "aws" {
  profile    = var.profile
  region     = lookup(var.aws_region, var.region)
}

module "roles" {
  source = "./modules/roles"
}

### Modules ###

module "retail_child" {
  source = "./modules/retail_child"
  lambda_retail_child_role_arn = module.roles.lambda_retail_child_role_arn
  
  region = var.region
  region_wrapper = var.region_wrapper
  access_token = var.access_token
  realm = var.realm
  metrics_url = var.metrics_url
  metrics_tracing = var.metrics_tracing
  apm_environment = var.apm_environment
}

module "retail_parent" {
  source = "./modules/retail_parent"
  lambda_retail_parent_role_arn = module.roles.lambda_retail_parent_role_arn
  lambda_retail_child_function_arn = module.retail_child.lambda_retail_child_function_arn

  region = var.region
  region_wrapper = var.region_wrapper
  access_token = var.access_token
  realm = var.realm
  metrics_url = var.metrics_url
  metrics_tracing = var.metrics_tracing
  apm_environment = var.apm_environment
}

# ## Prints arn of the Child Function, just used for debugging
# output "arn_of_Child_Function" {
#   value = module.retail_child.lambda_retail_child_function_arn
# }
