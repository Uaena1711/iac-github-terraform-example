# iac-github-example

A minimal **consumer** of the [iac-github](https://github.com/Uaena1711/iac-github) reusable
Terraform CI/CD catalog. Copy this layout into your own repo to get keyless Terraform
plan/apply/destroy with per-stack OIDC and Environment-gated approvals.

## Layout

```
.github/workflows/terraform.yml   # paved-road caller (calls the catalog reusable workflow)
modules/
  ssm-demo/  { main.tf, variables.tf, outputs.tf }   # shared local module
envs/
  dev/   { provider.tf, main.tf, tf-ci.env }   # main.tf just calls ../../modules/ssm-demo
  prod/  { provider.tf, main.tf, tf-ci.env }
```

Each directory under `envs/` is a **workspace**: it has the marker file `provider.tf` and a
`tf-ci.env` with that stack's identity, and a thin `main.tf` that wires inputs into the
shared **`modules/ssm-demo`** local module (`source = "../../modules/ssm-demo"`). The catalog
auto-detects which workspaces changed and runs them in parallel; because the caller sets
`shared_paths: modules`, a change to the module re-plans **every** environment.

## Setup

1. Edit each `envs/<env>/tf-ci.env` with your real values (role ARN, region, state bucket):
   ```sh
   AWS_ROLE_ARN=arn:aws:iam::<account-id>:role/<role>
   AWS_REGION=us-east-1
   AWS_STATE_BUCKET=<s3-bucket>
   AWS_STATE_KMS_KEY=<kms-key-arn>   # optional but recommended
   ```
2. Create the IAM role(s) trusting GitHub's OIDC provider, pinned to this repo — see the
   catalog's [trust-policy guidance](https://github.com/Uaena1711/iac-github#one-time-aws-trust-policy-per-role-set-up-outside-this-catalog).
3. Create GitHub **Environments** `dev` and `prod`; add required reviewers to `prod`.

## Usage

- **Pull request** → plan preview (no apply).
- **Push to `main`** → deploy (plan + apply; `prod` waits for approval).
- **Actions → Run workflow** → choose `deploy`, or `destroy` + a `dir` (e.g. `envs/dev`) to
  tear a workspace down via a reviewed destroy-plan.

`terraform-composed.yml.example` shows the full-override style (composing the catalog's
composite actions yourself) when you need custom steps in the flow.
