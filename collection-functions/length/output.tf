output "no_of_aws_instance" {
  value = length(var.ami_ids)
}
