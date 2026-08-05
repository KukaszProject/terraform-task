variable "name_prefix" {
  type        = string
  description = "Prefix used for all resource names"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed"
  default     = "East US"
}

variable "student_email" {
  type        = string
  description = "Student email used for tagging resources"
}

variable "git_repo_url" {
  type        = string
  description = "URL to the git repository containing the application"
}

variable "git_pat" {
  type        = string
  sensitive   = true
  description = "Personal Access Token for the Git repository to pull application code"
}

variable "image_name" {
  type        = string
  description = "Name of the Docker image to build and deploy"
  default     = "redis-flask-app"
}

variable "redis_hostname_secret" {
  type        = string
  description = "Key Vault secret name for the Redis hostname"
  default     = "redis-hostname"
}

variable "redis_primary_key_secret" {
  type        = string
  description = "Key Vault secret name for the Redis primary key"
  default     = "redis-primary-key"
}