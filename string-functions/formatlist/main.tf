provider "aws" {
  region = "us-west-2"
}

locals {
  security_group_rules = formatlist(
    "protocol = \"tcp\", from_port = %d, to_port = %d",
    var.ports,
    var.ports
  )
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Security group with rules for multiple ports"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
