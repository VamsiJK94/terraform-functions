provider "aws" {
  region = "us-west-2"
}

locals {
  # Combine all CIDR blocks into a single list
  all_cidrs = flatten([
    var.public_network_cidrs,
    var.private_network_cidrs,
    var.vpn_network_cidrs
  ])
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "A security group with merged CIDR blocks"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = local.all_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = local.all_cidrs
  }
}
