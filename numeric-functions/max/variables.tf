variable "calculated_storage" {
  description = "Calculated storage based on some logic"
  type        = number
  default     = 50
}

variable "minimum_storage" {
  description = "Minimum required storage to ensure performance"
  type        = number
  default     = 100
}