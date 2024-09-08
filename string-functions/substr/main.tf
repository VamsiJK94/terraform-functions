provider "aws" {
  region = "us-west-2"
}

locals {
  numeric_part = substr(var.resource_identifier, 4, 5)
  unique_resource_name = "resource-${local.numeric_part}"
}

resource "aws_s3_bucket" "example" {
  bucket = local.unique_resource_name
  
  tags = {
    Name        = local.unique_resource_name
    Environment = "production"
  }
}

