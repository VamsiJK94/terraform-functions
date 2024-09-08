variable "resource_tags" {
  description = "List of tags for resources"
  type        = list(string)
  default     = ["Environment: Production", "Team: DevOps"]
}