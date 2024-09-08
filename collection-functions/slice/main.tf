provider "aws" {
  region = "us-east-1"
}

locals {
  ami_ids = [
    "ami-12345678", 
    "ami-23456789",
    "ami-34567890",
    "ami-45678901",
    "ami-56789012"
  ]

  selected_ami_ids = slice(local.ami_ids, 0, 3) 
}

resource "aws_instance" "example" {
  count = length(local.selected_ami_ids)

  ami           = local.selected_ami_ids[count.index]
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance-${count.index + 1}"
  }
}

