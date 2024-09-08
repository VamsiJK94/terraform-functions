provider "local" {}

locals {
  database_config = <<-EOT
    database:
      host: ${var.database.host}
      port: ${var.database.port}
      username: ${var.database.username}
      password: ${var.database.password}
    EOT

  features_list = join("\n      ", var.features)

  app_config = <<-EOT
    application:
      name: ${var.app_name}
      ${indent(2, local.database_config)}
      features:
        ${local.features_list}
    EOT
}

resource "local_file" "app_config" {
  content  = local.app_config
  filename = "${path.module}/app_config.yaml"
}
