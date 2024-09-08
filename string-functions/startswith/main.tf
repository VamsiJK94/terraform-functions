provider "aws" {
  region = "us-west-2"
}

locals {
  filtered_bucket_names = [for name in var.bucket_names : name if startswith(name, "project-")]
}

resource "aws_s3_bucket" "example" {
  for_each = toset(local.filtered_bucket_names)

  bucket = each.key
}
