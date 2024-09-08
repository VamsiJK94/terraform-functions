provider "aws" {
  region = "us-east-1"
}

locals {
  instance_types = [
    "t2.micro",
    "t2.small"
  ]

  regions = [
    "us-east-1",
    "us-west-1"
  ]

  instance_combinations = setproduct(local.instance_types, local.regions)
}

resource "aws_instance" "example" {
  for_each = { for idx, combo in local.instance_combinations : idx => combo }

  ami           = "ami-12345678"  
  instance_type = each.value[0]
  availability_zone = each.value[1]

  tags = {
    Name = "Instance-${each.value[0]}-${each.value[1]}"
  }
}

