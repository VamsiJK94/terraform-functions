variable "public_network_cidrs" {
  description = "List of CIDR blocks for public networks"
  type        = list(list(string))
  default     = [
    ["192.168.1.0/24"],
    ["172.16.0.0/24"]
  ]
}

variable "private_network_cidrs" {
  description = "List of CIDR blocks for private networks"
  type        = list(list(string))
  default     = [
    ["10.0.0.0/16"],
    ["10.1.0.0/16"]
  ]
}

variable "vpn_network_cidrs" {
  description = "List of CIDR blocks for VPN networks"
  type        = list(list(string))
  default     = [
    ["10.2.0.0/24"],
    ["10.3.0.0/24"]
  ]
}
