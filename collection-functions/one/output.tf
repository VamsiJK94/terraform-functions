output "security_group_id" {
  description = "The ID of the security group used for the instance"
  value       = local.single_security_group_id
}
