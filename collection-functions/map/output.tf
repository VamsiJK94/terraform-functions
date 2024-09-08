output "iam_role_arns" {
  description = "ARNs of the IAM roles created"
  value       = { for k, v in aws_iam_role.example : k => v.arn }
}
