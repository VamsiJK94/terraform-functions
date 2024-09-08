provider "aws" {
  region = "us-east-1"
}

locals {
  instance_names = [
    "instance-01",
    "instance-02",
    "instance-03",
    "instance-04"
  ]

  reversed_instance_names = reverse(local.instance_names)
}

resource "aws_instance" "example" {
  count = length(local.reversed_instance_names)

  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"
  
  tags = {
    Name = local.reversed_instance_names[count.index]
  }
}


