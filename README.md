[![DelivOps banner](https://raw.githubusercontent.com/delivops/.github/main/images/banner.png?raw=true)](https://delivops.com)

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
  source  = "delivops/ecr/aws"
  version = "~> 1.0"

  repository_name     = "my-app"
  releases_prefixes   = ["v", "release"]
  releases_keep_count = 30
  others_keep_days    = 90
  scan_on_push        = true

  tags = {
    Environment = "production"
    Team        = "platform"
  }
}
```

## information

1. Time to create a ECR is around 30 sed.
2. Tagged are referenced to images that their prefix is 'v'.

## License

MIT

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | terraform-aws-modules/ecr/aws | 3.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_repository_policy"></a> [create\_repository\_policy](#input\_create\_repository\_policy) | Whether to create a repository policy | `bool` | `false` | no |
| <a name="input_mutability"></a> [mutability](#input\_mutability) | Image tag mutability setting (MUTABLE or IMMUTABLE) | `string` | `"MUTABLE"` | no |
| <a name="input_others_keep_days"></a> [others\_keep\_days](#input\_others\_keep\_days) | Number of days before other tagged images expire | `number` | `30` | no |
| <a name="input_protects_keep_count"></a> [protects\_keep\_count](#input\_protects\_keep\_count) | Number of images to retain for protected prefixes | `number` | `999999` | no |
| <a name="input_protects_prefix"></a> [protects\_prefix](#input\_protects\_prefix) | Tag prefixes to protect from lifecycle expiration | `list(string)` | <pre>[<br/>  "master",<br/>  "main"<br/>]</pre> | no |
| <a name="input_releases_keep_count"></a> [releases\_keep\_count](#input\_releases\_keep\_count) | Number of latest tagged images to keep | `number` | `30` | no |
| <a name="input_releases_prefixes"></a> [releases\_prefixes](#input\_releases\_prefixes) | Prefix of tagged images | `list(string)` | <pre>[<br/>  "sha",<br/>  "v"<br/>]</pre> | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | Name of the ECR repository | `string` | n/a | yes |
| <a name="input_repository_policy"></a> [repository\_policy](#input\_repository\_policy) | The JSON policy to apply to the repository (required if create\_repository\_policy is true) | `string` | `null` | no |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Enable image scanning on push | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the ECR repository | `map(string)` | `{}` | no |
| <a name="input_untagged_keep_days"></a> [untagged\_keep\_days](#input\_untagged\_keep\_days) | Number of days before untagged images expire | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_arn"></a> [repository\_arn](#output\_repository\_arn) | The ARN of the repository for IAM policies |
| <a name="output_repository_registry_id"></a> [repository\_registry\_id](#output\_repository\_registry\_id) | The registry ID (AWS account ID) where the repository was created |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | The URL of the repository for docker push/pull operations |
<!-- END_TF_DOCS -->
