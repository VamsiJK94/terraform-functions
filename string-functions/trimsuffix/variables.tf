variable "lambda_function_names_with_suffix" {
  description = "List of Lambda function names with a common suffix"
  type        = list(string)
  default     = [
    "my-first-function-lambda",
    "my-second-function-lambda",
    "my-third-function-lambda"
  ]
}