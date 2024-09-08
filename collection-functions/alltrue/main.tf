provider "aws" {
  region = "us-west-2"
}

locals {
  prerequisites_met = alltrue([
    var.network_configured,
    var.security_group_set,
    var.encryption_enabled
  ])
}

resource "aws_db_instance" "example" {
  count = local.prerequisites_met ? 1 : 0

  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "exampledb"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
