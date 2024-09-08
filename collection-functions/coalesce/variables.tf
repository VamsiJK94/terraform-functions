variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}