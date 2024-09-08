output "unique_resource_name" {
  description = "The unique resource name based on the extracted numeric part"
  value       = local.unique_resource_name
}
output "numeric_part" {
  description = "The extracted numeric part from the resource identifier"
  value       = local.numeric_part
}