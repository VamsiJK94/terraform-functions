provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Security group with multiple ingress rules"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr_block]
    }
  }

  tags = {
    Name = "example-sg"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc"
  }
}
