# prod differs only by intent: it maps to a `prod` GitHub Environment you configure with
# required reviewers, so apply pauses for approval. Same shared module, different inputs.
#
# `secret_note` here is injected as TF_VAR_secret_note from AWS Secrets Manager (awssm),
# proving the sensitive-var path works with a different provider than dev.
variable "secret_note" {
  description = "Injected as TF_VAR_secret_note by the pipeline (prod: from AWS Secrets Manager)."
  type        = string
  sensitive   = true
}

module "demo" {
  source = "../../modules/ssm-demo"

  name        = "/iac-github/demo/prod"
  note        = "managed by iac-github (prod)"
  secret_note = var.secret_note
  tags        = { env = "prod", managed_by = "iac-github" }
}
