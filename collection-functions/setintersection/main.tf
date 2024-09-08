provider "aws" {
  region = "us-east-1"
}

locals {
  required_tags = [
    "Environment",
    "Owner",
    "CostCenter"
  ]

  applied_tags = [
    "Environment",
    "CostCenter",
    "Project"
  ]

  common_tags = setintersection(local.required_tags, local.applied_tags)
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-12345"

  tags = {
    Environment  = "Development"
    Owner        = "TeamA"
    CostCenter   = "12345"
    Project      = "MyProject"
  }
}

