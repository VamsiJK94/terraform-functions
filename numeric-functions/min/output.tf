output "effective_iops" {
  description = "The provisioned IOPS after applying the minimum requirement"
  value       = local.effective_iops
}