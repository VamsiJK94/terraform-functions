provider "local" {}

locals {
  ip_pattern = "\\b(?:[0-9]{1,3}\\.){3}[0-9]{1,3}\\b"
  ip_addresses = regexall(local.ip_pattern, var.log_data)
}
