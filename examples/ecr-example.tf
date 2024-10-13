provider "aws" {
  region = "eu-west-1"
}
module "new-vops-ui" {
  source                   = "delivops/ecr/aws"
  version = "xxx"
  repository_name          = "new-vops-ui"
  keep_latest_count        = 10
  expire_days              = 30
  keep_latest_count_tagged = 10
  expire_days_tagged       = 30
}


