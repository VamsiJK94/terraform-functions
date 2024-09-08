provider "aws" {
  region = "us-west-2"
}

locals {
  unique_cidr_blocks = distinct(var.cidr_blocks)
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Security group with unique CIDR blocks"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = local.unique_cidr_blocks
  }
}

