provider "aws" {
  region = "us-west-2"
}

locals {
  chunk_size = 3
  user_chunks = chunklist(var.iam_users, local.chunk_size)
}

locals {
  flattened_users = flatten(local.user_chunks)
}

resource "aws_iam_user" "users" {
  for_each = toset(local.flattened_users)

  name = each.value
}
