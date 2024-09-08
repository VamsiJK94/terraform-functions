variable "tags" {
  description = "List of tags for the EC2 instance"
  type        = list(string)
  default     = ["Environment=Production", "Owner=TeamA", "Project=Terraform"]
}