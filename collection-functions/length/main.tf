provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  count = length(var.ami_ids)  # Creates one instance for each AMI ID

  ami           = var.ami_ids[count.index]
  instance_type = "t2.micro"

  tags = {
    Name = "instance-${count.index + 1}"
  }
}
