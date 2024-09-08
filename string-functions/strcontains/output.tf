output "environment_name" {
  description = "The name of the environment"
  value       = var.environment_name
}

output "is_production" {
  description = "Boolean indicating if the environment is production"
  value       = local.is_production
}
