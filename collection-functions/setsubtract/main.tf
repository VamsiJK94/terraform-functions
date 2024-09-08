provider "aws" {
  region = "us-east-1"
}

locals {
  existing_rules = [
    "10.0.0.0/24", 
    "192.168.1.0/24"
  ]

  proposed_rules = [
    "10.0.0.0/24",  
    "192.168.1.0/24",  
    "172.16.0.0/24"  
  ]

  rules_to_add = setsubtract(local.proposed_rules, local.existing_rules)
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Example security group"

  vpc_id = "vpc-12345678"  

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = local.rules_to_add
  }

  tags = {
    Name = "example-security-group"
  }
}

