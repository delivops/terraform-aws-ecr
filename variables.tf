variable "repository_name" {
  type = string
}

variable "mutability" {
  type    = string
  default = "MUTABLE"
}

variable "keep_latest_count" {
  description = "Number of latest images to keep"
  type        = number
  default     = 90
}

variable "expire_days" {
  description = "Number of days before images expire"
  type        = number
  default     = 90
}
variable "keep_latest_count_tagged" {
  description = "Number of latest tagged images to keep"
  type        = number
  default     = 90
}

variable "expire_days_tagged" {
  description = "Number of days before tagged images expire"
  type        = number
  default     = 90
}
