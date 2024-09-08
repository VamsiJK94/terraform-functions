variable "instance_names_with_spaces" {
  description = "List of EC2 instance names with potential leading/trailing spaces"
  type        = list(string)
  default     = [
    "  my-first-instance  ",
    "  my-second-instance  ",
    "  my-third-instance  "
  ]
}
