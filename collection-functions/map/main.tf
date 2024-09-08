provider "aws" {
  region = "us-west-2"
}

resource "aws_iam_role" "example" {
  for_each = var.environment_policies

  name               = "example-${each.key}-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "example-${each.key}-role"
  }
}

resource "aws_iam_role_policy_attachment" "example" {
  for_each = var.environment_policies

  policy_arn = each.value
  role      = aws_iam_role.example[each.key].name
}
