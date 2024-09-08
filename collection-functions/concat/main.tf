provider "aws" {
  region = "us-west-2"
}

locals {
  environment = "staging" 

  combined_security_groups = concat(
    var.base_security_groups,
    local.environment == "staging" ? var.staging_security_groups : var.prod_security_groups
  )
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"

  vpc_security_group_ids = local.combined_security_groups

  tags = {
    Name = "example-instance"
  }
}

