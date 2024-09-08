variable "base_memory_mb" {
  description = "Base memory allocation in MB"
  type        = number
  default     = 128
}

variable "growth_exponent" {
  description = "Exponent for scaling memory allocation"
  type        = number
  default     = 2
}