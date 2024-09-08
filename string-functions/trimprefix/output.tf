output "cleaned_bucket_names" {
  description = "The S3 bucket names with the common prefix removed"
  value       = local.cleaned_bucket_names
}
