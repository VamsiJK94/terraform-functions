provider "aws" {
  region = "us-west-2"
}

locals {
  formatted_tags = {
    for key, value in var.tags_input : key => title(value)
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = merge(
    {
      Name = var.instance_name
    },
    local.formatted_tags
  )
}
