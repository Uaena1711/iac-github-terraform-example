# Literal-config stack: runs the WHOLE pipeline inside one hashicorp/terraform:1.15.7
# container. No SECRETS_PROVIDER -> resolve-env is a no-op, so the image needs no jq/aws.
resource "aws_ssm_parameter" "demo" {
  name  = "/iac-github/demo/container"
  type  = "String"
  value = "deployed from a terraform:1.15.7 container"
}
