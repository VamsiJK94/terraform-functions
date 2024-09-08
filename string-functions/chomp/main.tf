provider "aws" {
  region = "us-west-2"
}

locals {
  clean_user_data_script = chomp(var.user_data_script)
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  user_data = local.clean_user_data_script

  tags = {
    Name = "example-instance"
  }
}
