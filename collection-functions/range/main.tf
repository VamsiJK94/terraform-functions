provider "aws" {
  region = "us-east-1"
}

locals {
  instance_indices = range(1, 10, 3)
  instance_names = [for i in local.instance_indices : "my-instance-${i}"]
}

resource "aws_instance" "example" {
  count = length(local.instance_indices)

  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  tags = {
    Name = local.instance_names[count.index]
  }
}

