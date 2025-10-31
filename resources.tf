module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "3.1.0"

  repository_name                 = var.repository_name
  repository_image_tag_mutability = var.mutability
  attach_repository_policy        = false
  repository_lifecycle_policy = jsonencode({
    rules = concat(
      [
        {
          rulePriority = 1,
          description  = "Protect ${join(", ", var.protects_prefix)} branches tags",
          selection = {
            tagStatus     = "tagged",
            tagPrefixList = var.protects_prefix,
            countType     = "imageCountMoreThan",
            countNumber   = var.protects_keep_count
          },
          action = {
            type = "expire"
          }
        }
      ],
      [
        for idx, prefix in var.releases_prefixes : {
          rulePriority = idx + 2, # Dynamic priority starting from 2
          description  = "Keep number of latest releases images for ${prefix}",
          selection = {
            tagStatus     = "tagged",
            tagPrefixList = [prefix],
            countType     = "imageCountMoreThan",
            countNumber   = var.releases_keep_count
          },
          action = {
            type = "expire"
          }
        }
      ],
      [
        {
          rulePriority = length(var.releases_prefixes) + 2,
          description  = "Expire all tagged images older than ${var.others_keep_days} days",
          selection = {
            tagStatus      = "tagged",
            tagPatternList = ["*"],
            countType      = "sinceImagePushed",
            countUnit      = "days",
            countNumber    = var.others_keep_days
          },
          action = {
            type = "expire"
          }
        },
        {
          rulePriority = length(var.releases_prefixes) + 3,
          description  = "Remove untagged images older than ${var.others_keep_days} days",
          selection = {
            tagStatus   = "untagged",
            countType   = "sinceImagePushed",
            countUnit   = "days",
            countNumber = var.untagged_keep_days
          },
          action = {
            type = "expire"
          }
        }
      ]
    )
  })
}
