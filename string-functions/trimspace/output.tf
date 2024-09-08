output "cleaned_instance_names" {
  description = "The EC2 instance names with leading/trailing spaces removed"
  value       = local.cleaned_instance_names
}
