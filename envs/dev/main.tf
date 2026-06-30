# Thin environment: just wires inputs into the shared local module (source = a path).
# A change under modules/ re-plans every env (the caller sets shared_paths: modules).
module "demo" {
  source = "../../modules/ssm-demo"

  name  = "/iac-github/demo/dev"
  value = "hello-dev-v2"
  tags  = { env = "dev", managed_by = "iac-github" }
}
