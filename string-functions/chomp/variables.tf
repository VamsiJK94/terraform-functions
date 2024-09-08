variable "user_data_script" {
  description = "User data script for EC2 instance"
  type        = string
  default     = <<EOF
#!/bin/bash
# Update and install Apache
yum update -y
yum install -y httpd

# Start Apache
systemctl start httpd
systemctl enable httpd
EOF
}