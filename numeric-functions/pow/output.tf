output "lambda_function_arn" {
  description = "The ARN of the created Lambda function"
  value       = aws_lambda_function.example.arn
}

output "calculated_memory_size_mb" {
  description = "The calculated memory size in MB based on the exponential growth factor"
  value       = local.memory_size
}