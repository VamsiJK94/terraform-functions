variable "iam_users" {
  description = "List of IAM users to be created"
  type        = list(string)
  default     = ["user1", "user2", "user3", "user4", "user5", "user6", "user7", "user8"]
}