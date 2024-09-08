provider "aws" {
  region = "us-west-2"
}

locals {
  reversed_string = strrev(var.base_string)
  unique_resource_name = "resource-${local.reversed_string}"
}

resource "aws_s3_bucket" "example" {
  bucket = local.unique_resource_name
  
  tags = {
    Name        = local.unique_resource_name
    Environment = "production"
  }
}
