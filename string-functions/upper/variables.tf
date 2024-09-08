variable "environment_names" {
  description = "List of environment names with mixed case"
  type        = list(string)
  default     = [
    "dev",
    "Test",
    "PROD",
    "Staging"
  ]
}