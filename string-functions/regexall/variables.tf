variable "log_data" {
  description = "Log data containing multiple IP addresses"
  type        = string
  default     = <<EOF
    [INFO] 2024-09-08 12:34:56 - Connection from 192.168.1.1
    [ERROR] 2024-09-08 12:35:56 - Connection from 10.0.0.2 failed
    [INFO] 2024-09-08 12:36:56 - Connection from 172.16.0.3
    [DEBUG] 2024-09-08 12:37:56 - Connection from 192.168.1.4
  EOF
}
