variable "repository_name" {
  type = string
}

variable "mutability" {
  type    = string
  default = "MUTABLE"
}

variable "releases_prefix" {
  description = "Prefix of tagged images"
  type        = string
  default     = "v"
}

variable "releases_keep_count" {
  description = "Number of latest tagged images to keep"
  type        = number
  default     = 30
}

variable "others_keep_days" {
  description = "Number of days before images expire"
  type        = number
  default     = 90
}
