variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    cidr_block = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
  default = [
    {
      cidr_block = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
    },
    {
      cidr_block = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },
    {
      cidr_block = "0.0.0.0/0"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
    }
  ]
}
