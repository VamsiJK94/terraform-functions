variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "base_role_name" {
  description = "The base name for the IAM role"
  type        = string
  default     = "my-application-role"
}