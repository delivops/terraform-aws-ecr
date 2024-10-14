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
module "my-repo-name" {
  source                   = "delivops/ecr/aws"
  version = "xxx"
  repository_name     = "new-vops-ui"
  releases_keep_count = "30"
  others_keep_days    = "90"
  releases_prefix     = "v"
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

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Modules

| Name                                         | Source                        | Version |
| -------------------------------------------- | ----------------------------- | ------- |
| <a name="module_ecr"></a> [ecr](#module_ecr) | terraform-aws-modules/ecr/aws | 2.3.0   |

## Resources

| Name                                                                                                                                  | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)         | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition)                     | data source |

## Inputs

| Name                                                                                                      | Description                                | Type     | Default     | Required |
| --------------------------------------------------------------------------------------------------------- | ------------------------------------------ | -------- | ----------- | :------: |
| <a name="input_expire_days"></a> [expire_days](#input_expire_days)                                        | Number of days before images expire        | `number` | `90`        |    no    |
| <a name="input_expire_days_tagged"></a> [expire_days_tagged](#input_expire_days_tagged)                   | Number of days before tagged images expire | `number` | `90`        |    no    |
| <a name="input_keep_latest_count"></a> [keep_latest_count](#input_keep_latest_count)                      | Number of latest images to keep            | `number` | `90`        |    no    |
| <a name="input_keep_latest_count_tagged"></a> [keep_latest_count_tagged](#input_keep_latest_count_tagged) | Number of latest tagged images to keep     | `number` | `90`        |    no    |
| <a name="input_mutability"></a> [mutability](#input_mutability)                                           | n/a                                        | `string` | `"MUTABLE"` |    no    |
| <a name="input_repository_name"></a> [repository_name](#input_repository_name)                            | n/a                                        | `string` | n/a         |   yes    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
