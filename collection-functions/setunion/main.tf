provider "aws" {
  region = "us-east-1"
}

locals {
  default_rules = [
    "10.0.0.0/24", 
    "192.168.1.0/24"
  ]

  custom_rules = [
    "172.16.0.0/24",  
    "10.0.0.0/24"  
  ]

  all_rules = setunion(local.default_rules, local.custom_rules)
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Example security group"

  vpc_id = "vpc-12345678" 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = local.all_rules
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = local.all_rules
  }

  tags = {
    Name = "example-security-group"
  }
}

