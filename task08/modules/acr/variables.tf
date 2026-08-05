variable "name" { type = string }
variable "location" { type = string }
variable "rg_name" { type = string }
variable "sku" { type = string }
variable "git_repo_url" { type = string }
variable "git_pat" { type = string }
variable "image_name" { type = string }
variable "tags" { type = map(string) }