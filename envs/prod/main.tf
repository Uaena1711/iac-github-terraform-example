# prod differs only by intent: it maps to a `prod` GitHub Environment you configure with
# required reviewers, so apply pauses for approval. Same shared module, different inputs.
module "demo" {
  source = "../../modules/ssm-demo"

  name  = "/iac-github/demo/prod"
  value = "hello-prod"
  tags  = { env = "prod", managed_by = "iac-github" }
}
