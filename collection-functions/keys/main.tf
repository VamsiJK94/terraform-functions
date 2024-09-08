provider "aws" {
  region = "us-west-2"
}

locals {
  security_groups = {
    dev     = ["10.0.0.0/16", "192.168.1.0/24"]
    staging = ["10.1.0.0/16"]
    prod    = ["10.2.0.0/16", "172.16.0.0/12"]
  }
}

resource "aws_security_group" "example" {
  for_each = toset(keys(local.security_groups))

  name        = "sg${each.key}"
  description = "Security Group for ${each.key} environment"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = local.security_groups[each.key]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

