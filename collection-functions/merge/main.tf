provider "aws" {
  region = "us-west-2"
}

locals {
  # Merge default tags with environment-specific tags
  merged_tags = merge(var.default_tags, var.environment_tags)
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = local.merged_tags
}
