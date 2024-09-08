variable "base_security_groups" {
  description = "List of base security group IDs"
  type        = list(string)
  default     = ["sg-12345678", "sg-87654321"]
}

variable "staging_security_groups" {
  description = "List of security group IDs for the staging environment"
  type        = list(string)
  default     = ["sg-11112222"]
}

variable "prod_security_groups" {
  description = "List of security group IDs for the production environment"
  type        = list(string)
  default     = ["sg-33334444"]
}