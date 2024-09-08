variable "bucket_names_with_prefix" {
  description = "List of S3 bucket names with a common prefix"
  type        = list(string)
  default     = [
    "s3-bucket-my-first-bucket",
    "s3-bucket-my-second-bucket",
    "s3-bucket-my-third-bucket"
  ]
}