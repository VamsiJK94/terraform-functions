variable "base_retries" {
  description = "Base number of retries"
  type        = number
  default     = 3
}

variable "success_rate" {
  description = "Current success rate of the task (percentage)"
  type        = number
  default     = 60
}

variable "threshold_success_rate" {
  description = "Success rate threshold to adjust retries"
  type        = number
  default     = 70
}