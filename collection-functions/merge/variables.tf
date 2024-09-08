variable "default_tags" {
  description = "Default tags for all instances"
  type        = map(string)
  default = {
    "Project"   = "MyProject"
    "Environment" = "Development"
  }
}

variable "environment_tags" {
  description = "Environment-specific tags"
  type        = map(string)
  default = {
    "Environment" = "Production"  # This will override the default "Environment" tag
    "Owner"        = "TeamA"
  }
}
