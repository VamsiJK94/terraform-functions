output "instance_ids" {
  description = "The IDs of the created EC2 instances"
  value       = aws_instance.example[*].id
}

output "instance_names" {
  description = "The names of the created EC2 instances"
  value       = aws_instance.example[*].tags["Name"]
}