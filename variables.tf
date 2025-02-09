variable "repository_name" {
  type = string
}

variable "mutability" {
  type    = string
  default = "MUTABLE"
}

variable "protects_prefix" {
  type    = list(string)
  default = ["master", "main"]
}

variable "protects_keep_count" {
  type    = number
  default = 999999

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
