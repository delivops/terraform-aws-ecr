module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "2.3.0"

  repository_name                 = var.repository_name
  repository_image_tag_mutability = var.mutability
  attach_repository_policy        = false
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep always latest",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["latest"],
          countType     = "imageCountMoreThan",
          countNumber   = 1
        },
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 100,
        description  = "Keep number of latest tagged images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = [var.releases_prefix],
          countType     = "imageCountMoreThan",
          countNumber   = var.releases_keep_count
        },
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 200,
        description  = "Expire all tagged images that older than",
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
        rulePriority = 400,
        description  = "Expire any images older than",
        selection = {
          tagStatus   = "any",
          countType   = "sinceImagePushed",
          countUnit   = "days",
          countNumber = var.others_keep_days
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}
