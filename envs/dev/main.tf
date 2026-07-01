# Thin environment: wires inputs into the shared local module (source = a path).
# A change under modules/ re-plans every env (the caller sets shared_paths: modules).
#
# `note` is a NORMAL variable (committed literal). `secret_note` is a SENSITIVE variable:
# the CI injects it as TF_VAR_secret_note from a vault (see tf-vars.env) — never committed,
# never written to disk, redacted from plan output.
variable "secret_note" {
  description = "Injected as TF_VAR_secret_note by the pipeline (dev: from a GitHub secret)."
  type        = string
  sensitive   = true
}

module "demo" {
  source = "../../modules/ssm-demo"

  name        = "/iac-github/demo/dev"
  note        = "managed by iac-github (dev)"
  secret_note = var.secret_note
  tags        = { env = "dev", managed_by = "iac-github" }
}
