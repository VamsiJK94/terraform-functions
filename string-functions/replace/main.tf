provider "aws" {
  region = "us-west-2"
}

locals {
  updated_rules = { for k, v in var.security_group_rules : 
    k => {
      cidr_blocks = v.cidr_blocks
      description = replace(v.description, "OLD_TERM", "NEW_TERM")
    }
  }
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Security group with updated rules"

  dynamic "ingress" {
    for_each = local.updated_rules
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }
}
