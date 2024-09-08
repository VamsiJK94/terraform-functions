variable "tag_keys" {
  description = "List of tag keys"
  type        = list(string)
  default     = ["Environment", "Owner"]
}

variable "tag_values" {
  description = "List of tag values"
  type        = list(string)
  default     = ["Production", "John Doe"]
}