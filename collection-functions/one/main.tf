provider "aws" {
  region = "us-west-2"
}

locals {
  single_security_group_id = one(data.aws_security_groups.sg.ids)
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [local.single_security_group_id]

  tags = {
    Name = "ExampleInstance"
  }
}

