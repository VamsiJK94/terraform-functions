provider "aws" {
  region = "us-west-2"
}

locals {
  retry_adjustment = signum(var.success_rate - var.threshold_success_rate)
  adjusted_retries = max(var.base_retries + local.retry_adjustment, 0)
}

resource "aws_lambda_function" "example" {
  function_name = "example_lambda_function"
  s3_bucket     = "example-bucket"
  s3_key        = "lambda_function.zip"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  environment {
    variables = {
      retries = local.adjusted_retries
    }
  }
  role = "arn:aws:iam::123456789012:role/service-role/lambda-role"
  timeout = 30
}
