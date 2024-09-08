variable "cidr_blocks" {
  description = "List of CIDR blocks for security group rules"
  type        = list(string)
  default     = [
    "10.0.0.0/24",
    "192.168.1.0/24",
    "10.0.0.0/24",  # Duplicate entry
    "172.16.0.0/24"
  ]
}