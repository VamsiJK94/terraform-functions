provider "aws" {
  region = "us-west-1"
}

locals {
  all_tags = values(var.security_groups)

  flattened_tags = flatten(local.all_tags)

  unique_tags = distinct(local.flattened_tags)
}

resource "aws_sns_topic" "alerts" {
  for_each = toset(local.unique_tags)

  name = "alert-${each.value}"
}

resource "aws_sns_topic_subscription" "alert_subscriptions" {
  for_each = toset(local.unique_tags)

  topic_arn = aws_sns_topic.alerts[each.value].arn
  protocol  = "email"
  endpoint  = "example@example.com" # Replace with actual email addresses
}

