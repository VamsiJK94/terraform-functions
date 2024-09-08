variable "security_groups" {
  description = "Map of security groups with their tags."
  type = map(list(string))
  default = {
    "sg-12345678" = ["production", "web"],
    "sg-87654321" = ["development", "api"],
    "sg-abcdef12" = ["staging", "database"]
  }
}
