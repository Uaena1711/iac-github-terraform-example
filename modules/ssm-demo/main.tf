# A tiny shared module so every environment reuses the same resource definition
# (the realistic shape: envs are thin, the module holds the logic).
terraform {
  required_version = ">= 1.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

resource "aws_ssm_parameter" "this" {
  name        = var.name
  type        = "String"
  value       = var.value
  description = "managed by iac-github"
  tags        = var.tags
}
