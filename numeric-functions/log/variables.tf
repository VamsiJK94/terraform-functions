variable "performance_metric" {
  description = "Performance metric value that grows logarithmically"
  type        = number
  default     = 100
}

variable "log_base" {
  description = "Base for the logarithm function"
  type        = number
  default     = 10
}
