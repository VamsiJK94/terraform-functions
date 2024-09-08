provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "examplebucket"
  acl    = "private"
}

resource "aws_s3_bucket_object" "lambda_code" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "lambda_function.zip"
  source = "path/lambda_function.zip"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role      = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

locals {
  calculated_memory_size = pow(var.base_memory_mb, var.growth_exponent)
  
  memory_size = min(max(local.calculated_memory_size, 128), 10240)
}

resource "aws_lambda_function" "example" {
  function_name = "example_lambda_function"
  s3_bucket     = aws_s3_bucket.lambda_bucket.bucket
  s3_key        = aws_s3_bucket_object.lambda_code.key
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  
  role = aws_iam_role.lambda_role.arn

  memory_size = local.memory_size
  timeout     = 10
  environment {
    variables = {
      example_var = "example_value"
    }
  }
}

