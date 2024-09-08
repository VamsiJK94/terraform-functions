variable "environment_tags" {
  description = "Map of environment-specific tags"
  type = map(map(string))
  default = {
    development = {
      "Owner"   = "dev-team"
      "Project" = "dev-project"
    }
    staging = {
      "Owner"   = "staging-team"
      "Project" = "staging-project"
    }
    production = {
      "Owner"   = "prod-team"
      "Project" = "prod-project"
    }
  }
}
