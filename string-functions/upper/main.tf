provider "aws" {
  region = "us-west-2"
}

locals {
  uppercase_environment_names = [for name in var.environment_names : upper(name)]
}

resource "aws_instance" "example" {
  count         = length(local.uppercase_environment_names)
  ami           = "ami-0c55b159cbfafe1f0"  # Example AMI ID
  instance_type = "t2.micro"
  tags = {
    Name        = "Instance-${local.uppercase_environment_names[count.index]}"
    Environment = local.uppercase_environment_names[count.index]
  }
}
