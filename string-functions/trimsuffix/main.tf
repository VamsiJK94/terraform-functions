provider "aws" {
  region = "us-west-2"
}

locals {
  suffix = "-lambda"

  cleaned_function_names = [for name in var.lambda_function_names_with_suffix : trimsuffix(name, local.suffix)]
}
