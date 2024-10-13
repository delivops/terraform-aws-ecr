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
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = var.keep_latest_count_tagged
        },
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 300,
        description  = "Expire all older tagged than",
        selection = {
          tagStatus      = "tagged",
          tagPatternList = ["v*"],
          countType      = "sinceImagePushed",
          countUnit      = "days",
          countNumber    = var.expire_days_tagged
        },
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 200,
        description  = "Keep number of latest images",
        selection = {
          tagStatus      = "tagged",
          tagPatternList = ["*"],
          countType      = "imageCountMoreThan",
          countNumber    = var.keep_latest_count
        },
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 400,
        description  = "Expire all older than",
        selection = {
          tagStatus   = "any",
          countType   = "sinceImagePushed",
          countUnit   = "days",
          countNumber = var.expire_days
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}
