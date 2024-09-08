variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 3
}

variable "tags_list" {
  description = "List of tags to assign to instances"
  type        = list(string)
  default     = [
    "Tag-One",
    "Tag-Two",
    "Tag-Three"
  ]
}