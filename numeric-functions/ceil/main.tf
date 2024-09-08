provider "aws" {
  region = "us-west-2"
}

locals {
  rounded_storage_units = ceil(var.storage_needs)
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = local.rounded_storage_units
  tags = {
    Name = "storage-volume-${local.rounded_storage_units}"
  }
}
