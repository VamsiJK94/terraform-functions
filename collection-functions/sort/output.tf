output "sorted_security_group_rules" {
  description = "Sorted security group rules by port"
  value       = local.sorted_rules
}
