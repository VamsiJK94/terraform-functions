variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "my-application"
}

variable "database" {
  description = "Database configuration"
  type = object({
    host     = string
    port     = number
    username = string
    password = string
  })
  default = {
    host     = "localhost"
    port     = 5432
    username = "admin"
    password = "secret"
  }
}

variable "features" {
  description = "List of features to enable"
  type        = list(string)
  default     = ["feature1", "feature2", "feature3"]
}