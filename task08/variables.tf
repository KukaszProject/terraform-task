variable "name_prefix" {
  type        = string
  description = "Prefix used for all resource names"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "student_email" {
  type = string
}

variable "git_repo_url" {
  type        = string
  description = "URL to the git repository containing the application"
}

variable "git_pat" {
  type        = string
  sensitive   = true
  description = "Personal Access Token for the Git repository"
}

variable "image_name" {
  type    = string
  default = "redis-flask-app"
}

variable "redis_hostname_secret" {
  type    = string
  default = "redis-hostname"
}

variable "redis_primary_key_secret" {
  type    = string
  default = "redis-primary-key"
}