provider "aws" {
  region = "us-west-2"
}

locals {
  scaling_factor = log(var.performance_metric, var.log_base)
}

resource "aws_autoscaling_group" "example" {
  desired_capacity = ceil(local.scaling_factor)
  min_size          = ceil(local.scaling_factor)
  max_size          = ceil(local.scaling_factor) + 2
  vpc_zone_identifier = ["subnet-0123456789abcdef0"]

  launch_configuration = aws_launch_configuration.example.id
}

resource "aws_launch_configuration" "example" {
  image_id      = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}
