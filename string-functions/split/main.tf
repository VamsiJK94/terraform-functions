provider "aws" {
  region = "us-west-2"
}

locals {
  bucket_names_list = split(",", var.bucket_names_string)
}

resource "aws_s3_bucket" "example" {
  for_each = toset(local.bucket_names_list)

  bucket = each.key
}
