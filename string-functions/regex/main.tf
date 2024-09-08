provider "aws" {
  region = "us-west-2"
}

locals {
  instance_id_unique = regex("i-(.+)", var.instance_id)[0]
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
    ID_Unique = local.instance_id_unique
  }
}
