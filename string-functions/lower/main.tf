provider "aws" {
  region = "us-west-2"
}

locals {
  normalized_bucket_name = lower(var.bucket_name)
}

resource "aws_s3_bucket" "example" {
  bucket = local.normalized_bucket_name

  tags = {
    Name = local.normalized_bucket_name
  }
}
