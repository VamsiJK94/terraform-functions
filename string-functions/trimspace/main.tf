provider "aws" {
  region = "us-west-2"
}

locals {
  cleaned_instance_names = [for name in var.instance_names_with_spaces : trimspace(name)]
}

resource "aws_instance" "example" {
  for_each = toset(local.cleaned_instance_names)
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = each.value
  }
}
