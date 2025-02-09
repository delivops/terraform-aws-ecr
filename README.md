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
| <a name="input_mutability"></a> [mutability](#input\_mutability) | n/a | `string` | `"MUTABLE"` | no |
| <a name="input_others_keep_days"></a> [others\_keep\_days](#input\_others\_keep\_days) | Number of days before other tagged images expire | `number` | `30` | no |
| <a name="input_protects_keep_count"></a> [protects\_keep\_count](#input\_protects\_keep\_count) | n/a | `number` | `999999` | no |
| <a name="input_protects_prefix"></a> [protects\_prefix](#input\_protects\_prefix) | n/a | `list(string)` | <pre>[<br/>  "master",<br/>  "main"<br/>]</pre> | no |
| <a name="input_releases_keep_count"></a> [releases\_keep\_count](#input\_releases\_keep\_count) | Number of latest tagged images to keep | `number` | `30` | no |
| <a name="input_releases_prefixes"></a> [releases\_prefixes](#input\_releases\_prefixes) | Prefix of tagged images | `list(string)` | <pre>[<br/>  "sha",<br/>  "v"<br/>]</pre> | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | n/a | `string` | n/a | yes |
| <a name="input_untagged_keep_days"></a> [untagged\_keep\_days](#input\_untagged\_keep\_days) | Number of days before untagged images expire | `number` | `1` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
