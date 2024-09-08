provider "aws" {
  region = "us-west-2"
}

locals {
  port_range_start = parseint(var.port_range_start_str, 10)
  port_range_end   = parseint(var.port_range_end_str, 10)
}

resource "aws_security_group" "example" {
  name_prefix = "example-sg-"

  ingress {
    from_port   = local.port_range_start
    to_port     = local.port_range_end
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
