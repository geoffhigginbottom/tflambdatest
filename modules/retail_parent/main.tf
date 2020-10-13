resource "aws_lambda_function" "parent" {
  filename      = "./modules/retail_parent/RetailParent.zip"
  function_name = var.parent_function_name
  role          = var.lambda_retail_parent_role_arn
  handler       = "lambda_function.lambda_handler"
  layers        = [lookup(var.region_wrapper, var.region)]
  runtime       = "python3.8"
  timeout       = 10

  environment {
    variables = {
      CHILD_FUNCTION_ARN = var.lambda_retail_child_function_arn
      SIGNALFX_ACCESS_TOKEN = var.access_token
      SIGNALFX_APM_ENVIRONMENT = var.apm_environment
      SIGNALFX_METRICS_URL = var.metrics_url
      SIGNALFX_TRACING_URL = var.metrics_tracing
    }
  }
}
