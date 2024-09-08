variable "ports" {
  description = "List of ports to allow inbound traffic"
  type        = list(number)
  default     = [80, 443, 8080]
}
