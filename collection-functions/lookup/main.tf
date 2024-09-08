provider "aws" {
  region = "us-west-2"
}

locals {
  environment = "staging"  # This could be set dynamically or based on some condition
  selected_tags = lookup(var.environment_tags, local.environment, {})
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"  # Replace with your AMI ID
  instance_type = "t2.micro"

  tags = merge(
    {
      "Name" = "example-instance"
    },
    local.selected_tags
  )
}
