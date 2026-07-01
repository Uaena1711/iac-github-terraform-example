<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_demo"></a> [demo](#module\_demo) | ../../modules/ssm-demo | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_secret_note"></a> [secret\_note](#input\_secret\_note) | Injected as TF\_VAR\_secret\_note by the pipeline (dev: from a GitHub secret). | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->