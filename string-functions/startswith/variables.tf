variable "bucket_names" {
  description = "List of bucket names"
  type        = list(string)
  default     = ["project-dev-data", "project-prod-logs", "test-bucket", "project-test"]
}