provider "aws" {
  region = "us-east-1"
}

# Define instance types and their monthly costs
locals {
  instance_costs = {
    "t2.micro"  = 8.00   # Example cost per month in USD
    "t2.small"  = 16.00
    "t2.medium" = 32.00
  }

  # Define the number of each instance type to be deployed
  instance_counts = {
    "t2.micro"  = 3
    "t2.small"  = 2
    "t2.medium" = 1
  }

  # Calculate total monthly cost for each instance type
  total_costs = [
    for instance_type, cost in local.instance_costs : cost * local.instance_counts[instance_type]
  ]

  # Calculate total cost of all instances
  total_monthly_cost = sum(local.total_costs)
}

# Example output to show the total cost
output "total_monthly_cost" {
  description = "Total monthly cost of all EC2 instances"
  value       = local.total_monthly_cost
}
