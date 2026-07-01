# prod differs only by intent: it maps to a `prod` GitHub Environment you configure with
# required reviewers, so apply pauses for approval. Same shared module, different inputs.
variable "secret_note" {
  description = "Injected as TF_VAR_secret_note by the pipeline (from a GitHub secret)."
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
