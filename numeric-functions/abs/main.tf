provider "aws" {
  region = "us-west-2" 
}

locals {
  absolute_value = abs(var.example_number)
  validated_instance_count = abs(var.instance_count)
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "example-instance-${local.absolute_value}"
  }
}

resource "aws_launch_configuration" "example" {
  image_id      = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example" {
  desired_capacity = local.validated_instance_count
  min_size          = local.validated_instance_count
  max_size          = local.validated_instance_count + 2
  vpc_zone_identifier = ["subnet-0123456789abcdef0"]

  launch_configuration = aws_launch_configuration.example.id

  provisioner "local-exec" {
    command = "echo Auto Scaling Group with desired capacity: ${local.validated_instance_count}"
  }
}

