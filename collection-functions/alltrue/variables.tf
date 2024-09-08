variable "network_configured" {
  description = "Whether the network is properly configured"
  type        = bool
  default     = true
}

variable "security_group_set" {
  description = "Whether the security group is set up correctly"
  type        = bool
  default     = true
}

variable "encryption_enabled" {
  description = "Whether encryption is enabled"
  type        = bool
  default     = false
}
