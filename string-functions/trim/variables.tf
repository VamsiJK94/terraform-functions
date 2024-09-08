variable "bucket_name_input" {
  description = "The name of the S3 bucket, potentially with unwanted characters"
  type        = string
  default     = "*!my-bucket-name!*"
}
