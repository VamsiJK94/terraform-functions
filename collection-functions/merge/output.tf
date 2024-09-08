output "instance_tags" {
  description = "The tags applied to the EC2 instance"
  value       = local.merged_tags
}
