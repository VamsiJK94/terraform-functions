provider "aws" {
  region = "us-west-2"
}

locals {
  instance_name_final = coalesce(var.instance_name, "default-instance-name")
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type

  tags = {
    Name = local.instance_name_final
  }
}
