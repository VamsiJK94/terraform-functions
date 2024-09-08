variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  default     = "myec2instance"
}

variable "tags_input" {
  description = "Tags input with inconsistent casing"
  type        = map(string)
  default     = {
    environment = "staging"
    application = "webserver"
    owner       = "admin"
  }
}