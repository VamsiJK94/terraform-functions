provider "aws" {
  region = "us-west-2"
}

locals {
  is_production = strcontains(var.environment_name, "prod")
}

resource "aws_s3_bucket" "example" {
  count = local.is_production ? 1 : 0

  bucket = "prod-specific-bucket-${count.index}"

  tags = {
    Name        = "prod-specific-bucket"
    Environment = var.environment_name
  }
}
