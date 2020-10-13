resource "aws_lambda_function" "child" {
  filename      = "./modules/retail_child/RetailChild.zip"
  function_name = "RetailChild"
  role          = var.lambda_retail_child_role_arn
  handler       = "llambda_function.lambda_handler"
  layers        = [lookup(var.region_wrapper, var.region)]
  runtime       = "python3.8"
  timeout       = 10

  environment {
    variables = {
      SIGNALFX_ACCESS_TOKEN = var.access_token
      SIGNALFX_APM_ENVIRONMENT = var.apm_environment
      SIGNALFX_METRICS_URL = var.metrics_url
      SIGNALFX_TRACING_URL = var.metrics_tracing
    }
  }
}

output "lambda_retail_child_function_arn" {
  value = aws_lambda_function.child.arn
}
