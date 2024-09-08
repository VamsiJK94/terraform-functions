provider "aws" {
  region = "us-west-2"
}

locals {
  expected_suffix = ".json"
  key_ends_with_suffix = endswith(var.object_key, local.expected_suffix)
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-12345"
}

resource "aws_s3_bucket_object" "example" {
  count = local.key_ends_with_suffix ? 1 : 0

  bucket = aws_s3_bucket.example.bucket
  key    = var.object_key
  source = "path/to/local/file.json"

  content_type = "application/json"

  lifecycle {
    prevent_destroy = true
  }
}
