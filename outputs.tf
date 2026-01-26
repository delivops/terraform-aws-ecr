output "repository_url" {
  description = "The URL of the repository for docker push/pull operations"
  value       = module.ecr.repository_url
}

output "repository_arn" {
  description = "The ARN of the repository for IAM policies"
  value       = module.ecr.repository_arn
}

output "repository_registry_id" {
  description = "The registry ID (AWS account ID) where the repository was created"
  value       = module.ecr.repository_registry_id
}
