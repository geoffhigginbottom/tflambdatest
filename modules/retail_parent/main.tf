resource "null_resource" "lambda_function_file" {
  provisioner "local-exec" {
    command = "curl -o ${path.module}/lambda_function.py ${var.retail_parent_function_url}"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "rm ${path.module}/lambda_function.py && rm ${path.module}/lambda.zip"
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file  = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda.zip"
  depends_on = [null_resource.lambda_function_file]
}

resource "aws_lambda_function" "parent" {
  filename      = "./modules/retail_parent/lambda.zip"
  function_name = var.parent_function_name
  role          = var.lambda_retail_parent_role_arn
  handler       = "lambda_function.lambda_handler"
  layers        = [lookup(var.region_wrapper, var.region)]
  runtime       = "python3.8"
  timeout       = 90

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
