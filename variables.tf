variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "mutability" {
  description = "Image tag mutability setting (MUTABLE or IMMUTABLE)"
  type        = string
  default     = "MUTABLE"
}

variable "protects_prefix" {
  description = "Tag prefixes to protect from lifecycle expiration"
  type        = list(string)
  default     = ["master", "main"]
}

variable "protects_keep_count" {
  description = "Number of images to retain for protected prefixes"
  type        = number
  default     = 999999
}

variable "releases_prefixes" {
  description = "Prefix of tagged images"
  type        = list(string)
  default     = ["sha", "v"]
}

variable "releases_keep_count" {
  description = "Number of latest tagged images to keep"
  type        = number
  default     = 30
}

variable "others_keep_days" {
  description = "Number of days before other tagged images expire"
  type        = number
  default     = 30
}

variable "untagged_keep_days" {
  description = "Number of days before untagged images expire"
  type        = number
  default     = 1
}

variable "scan_on_push" {
  description = "Enable image scanning on push"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to the ECR repository"
  type        = map(string)
  default     = {}
}

variable "create_repository_policy" {
  description = "Whether to create a repository policy"
  type        = bool
  default     = false
}

variable "repository_policy" {
  description = "The JSON policy to apply to the repository (required if create_repository_policy is true)"
  type        = string
  default     = null

  validation {
    condition     = !var.create_repository_policy || var.repository_policy != null
    error_message = "repository_policy must be provided when create_repository_policy is true."
  }
}
