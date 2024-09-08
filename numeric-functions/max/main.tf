provider "aws" {
  region = "us-west-2"
}

locals {
  effective_storage = max(var.calculated_storage, var.minimum_storage)
}

resource "aws_db_instance" "example" {
  allocated_storage    = local.effective_storage
  instance_class       = "db.t3.micro"
  engine               = "mysql"
  engine_version       = "8.0"
  username             = "admin"
  password             = "your_password"
  db_name              = "exampledb"
  publicly_accessible  = true
  storage_type         = "gp2"
  backup_retention_period = 7
  multi_az                = false
  final_snapshot_identifier = "example-final-snapshot"
  vpc_security_group_ids = [
    "sg-0123456789abcdef0" 
  ]
  tags = {
    Name = "example-rds-instance"
  }
}
