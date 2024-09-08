provider "aws" {
  region = "us-west-2"
}

locals {
  cleaned_bucket_name = trim(var.bucket_name_input, "*!")
}

resource "aws_s3_bucket" "example" {
  bucket = local.cleaned_bucket_name

  tags = {
    Name = local.cleaned_bucket_name
  }
}
