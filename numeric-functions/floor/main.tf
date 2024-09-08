provider "aws" {
  region = "us-west-2"
}

locals {
  reserved_instances_needed = floor(var.user_count)
}

resource "aws_instance" "reserved" {
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"
  count         = local.reserved_instances_needed 

  tags = {
    Name = "reserved-instance-${local.reserved_instances_needed}"
  }
}
