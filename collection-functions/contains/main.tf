provider "aws" {
  region = "us-west-2"
}

locals {
  production_tag_present = contains(var.resource_tags, "Environment: Production")
}

resource "aws_instance" "example" {
  count         = local.production_tag_present ? 1 : 0
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
