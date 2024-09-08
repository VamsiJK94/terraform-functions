provider "aws" {
  region = "us-west-2"
}

locals {
  any_feature_enabled = anytrue([
    var.enable_logging,
    var.enable_monitoring,
    var.enable_alerting
  ])
}

resource "aws_s3_bucket" "example" {
  count = local.any_feature_enabled ? 1 : 0

  bucket = "example-logs-bucket"
}
