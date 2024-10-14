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




