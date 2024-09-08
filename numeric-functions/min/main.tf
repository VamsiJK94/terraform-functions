provider "aws" {
  region = "us-west-2"
}

locals {
  effective_iops = min(var.calculated_iops, var.minimum_iops)
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 100
  type              = "io1"
  iops              = local.effective_iops
  tags = {
    Name = "example-ebs-volume"
  }
}
