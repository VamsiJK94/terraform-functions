variable "port_range_start_str" {
  description = "The starting port of the security group rule range as a string"
  type        = string
  default     = "80"
}

variable "port_range_end_str" {
  description = "The ending port of the security group rule range as a string"
  type        = string
  default     = "100"
}