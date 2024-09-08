provider "aws" {
  region = "us-west-2"
}

locals {
  iam_role_name = format("%s-%s", var.base_role_name, var.environment)
}

resource "aws_iam_role" "example" {
  name = local.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = local.iam_role_name
  }
}
