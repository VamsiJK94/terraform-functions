variable "enable_logging" {
  description = "Whether logging is enabled"
  type        = bool
  default     = false
}

variable "enable_monitoring" {
  description = "Whether monitoring is enabled"
  type        = bool
  default     = true
}

variable "enable_alerting" {
  description = "Whether alerting is enabled"
  type        = bool
  default     = false
}