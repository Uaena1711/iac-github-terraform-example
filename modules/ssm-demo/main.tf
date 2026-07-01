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

# The sensitive input lands in a SecureString (encrypted with the default aws/ssm KMS key),
# so it's protected at rest as well as in transit. `note` is a normal variable shown in plan.
resource "aws_ssm_parameter" "this" {
  name        = var.name
  type        = "SecureString"
  value       = var.secret_note
  description = var.note
  tags        = var.tags
}
