terraform {
  required_providers {
    aws = {}
  }
}

data "aws_partition" "current" {}
data "aws_availability_zones" "available" {}
data "aws_caller_identity" "current" {}
