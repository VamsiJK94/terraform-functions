provider "aws" {
  region = "us-west-2"
}

locals {
  # Generate a list of indices based on the number of instances
  instance_indices = [for i in range(var.instance_count) : i]

  # Map each instance index to a tag from the tags_list
  instance_tags = [for idx in local.instance_indices : element(var.tags_list, idx % length(var.tags_list))]
}

resource "aws_instance" "example" {
  count = var.instance_count

  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name = local.instance_tags[count.index]
  }
}

