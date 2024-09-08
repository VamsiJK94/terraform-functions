provider "aws" {
  region = "us-west-2"
}

# Define optional IP ranges for security group rules
variable "ip_ranges" {
  description = "List of IP ranges for security group rules"
  type        = list(string)
  default     = ["10.0.0.0/24", null, "192.168.1.0/24", null, "172.16.0.0/24"]
}

# Clean up the list to remove null values
locals {
  cleaned_ip_ranges = compact(var.ip_ranges)
}

# Create a security group with ingress rules based on the cleaned IP ranges
resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Example security group"

  # Add ingress rules based on the cleaned IP ranges
  dynamic "ingress" {
    for_each = local.cleaned_ip_ranges
    content {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }
}

# Output the cleaned IP ranges
output "cleaned_ip_ranges" {
  description = "The list of IP ranges used for the security group rules"
  value       = local.cleaned_ip_ranges
}
