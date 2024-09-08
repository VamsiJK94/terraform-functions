provider "aws" {
  region = "us-west-2"
}

locals {
  tags_string = join(", ", var.tags)
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
    Tags = local.tags_string
  }
}
