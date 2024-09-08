provider "aws" {
  region = "us-west-1"
}

locals {
  tags = zipmap(var.tag_keys, var.tag_values)
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  
  tags = local.tags
}
