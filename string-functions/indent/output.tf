output "config_file_path" {
  description = "Path to the generated configuration file"
  value       = local_file.app_config.filename
}
