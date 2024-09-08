output "cleaned_bucket_name" {
  description = "The cleaned S3 bucket name with unwanted characters removed"
  value       = local.cleaned_bucket_name
}
