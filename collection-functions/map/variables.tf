variable "environment_policies" {
  description = "Map of environment names to IAM policy ARNs"
  type = map(string)
  default = {
    development = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    staging     = "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    production  = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  }
}
