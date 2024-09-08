variable "calculated_iops" {
  description = "Calculated IOPS based on performance metrics"
  type        = number
  default     = 500
}

variable "minimum_iops" {
  description = "Minimum IOPS to ensure performance"
  type        = number
  default     = 1000
}