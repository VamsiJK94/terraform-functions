provider "aws" {
  region = "us-east-1"
}

locals {
  security_group_rules = [
    { cidr = "10.0.1.0/24", port = 22, protocol = "tcp" },  # SSH
    { cidr = "0.0.0.0/0", port = 80, protocol = "tcp" },   # HTTP
    { cidr = "0.0.0.0/0", port = 443, protocol = "tcp" },  # HTTPS
    { cidr = "10.0.2.0/24", port = 5432, protocol = "tcp" }  # PostgreSQL
  ]

  sorted_rules = sort([
    for rule in local.security_group_rules : rule.port
  ])
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Security group with sorted rules"

  dynamic "ingress" {
    for_each = local.security_group_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr]
    }
  }
}

