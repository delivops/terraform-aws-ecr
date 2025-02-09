provider "aws" {
  region = "us-east-1"
}
module "my-repo-name" {
  source              = "../"
  repository_name     = "new-vops-ui"
  releases_keep_count = "30"
  protects_prefix     = ["master", "main"]
  others_keep_days    = "90"
  releases_prefixes   = ["v1", "v2", "v3"]
}




