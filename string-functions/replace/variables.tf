variable "security_group_rules" {
  description = "A map of security group rules with outdated descriptions"
  type = map(object({
    cidr_blocks = list(string)
    description = string
  }))
  default = {
    "rule1" = {
      cidr_blocks = ["10.0.0.0/24"],
      description = "Allow access for OLD_TERM service"
    }
    "rule2" = {
      cidr_blocks = ["192.168.1.0/24"],
      description = "Allow access for OLD_TERM application"
    }
  }
}