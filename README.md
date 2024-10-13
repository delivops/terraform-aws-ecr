# Terraform ECR Module

This Terraform module creates an Amazon Elastic Container Registry (ECR) repository with a configurable lifecycle policy for image management.

## Features

- **Repository Creation**: Creates an ECR repository with a specified name.
- **Image Tag Mutability**: Configures image tag mutability based on user input.
- **Lifecycle Policy**: Implements a lifecycle policy to manage image retention automatically.

## Usage

```hcl
################################################################################
# AWS ECR
################################################################################

provider "aws" {
  region = "eu-west-1"
}
module "my-ecr-repo" {
  source                   = "delivops/ecr/aws"
  version = "xxx"
  repository_name          = "new-vops-ui"
  keep_latest_count        = 10
  expire_days              = 30
  keep_latest_count_tagged = 10
  expire_days_tagged       = 30
}
```

## information

1. Time to create a ECR is around 30 sed.
2. Tagged are referenced to images that their prefix is 'v'.

## License

MIT

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | terraform-aws-modules/ecr/aws | 2.3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_expire_days"></a> [expire\_days](#input\_expire\_days) | Number of days before images expire | `number` | `90` | no |
| <a name="input_expire_days_tagged"></a> [expire\_days\_tagged](#input\_expire\_days\_tagged) | Number of days before tagged images expire | `number` | `90` | no |
| <a name="input_keep_latest_count"></a> [keep\_latest\_count](#input\_keep\_latest\_count) | Number of latest images to keep | `number` | `90` | no |
| <a name="input_keep_latest_count_tagged"></a> [keep\_latest\_count\_tagged](#input\_keep\_latest\_count\_tagged) | Number of latest tagged images to keep | `number` | `90` | no |
| <a name="input_mutability"></a> [mutability](#input\_mutability) | n/a | `string` | `"MUTABLE"` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
