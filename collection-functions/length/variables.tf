variable "ami_ids" {
  description = "List of AMI IDs for EC2 instances"
  type        = list(string)
  default     = ["ami-0abcdef1234567890", "ami-1bcdef234567890ab", "ami-2cdef345678901bcd"]
}
