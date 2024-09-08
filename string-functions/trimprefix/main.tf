provider "aws" {
  region = "us-west-2"
}

locals {
  prefix = "s3-bucket-"

  cleaned_bucket_names = [for name in var.bucket_names_with_prefix : trimprefix(name, local.prefix)]
}

resource "aws_s3_bucket" "example" {
  for_each = toset(local.cleaned_bucket_names)
  bucket   = each.value

  tags = {
    Name = each.value
  }
}
