locals {
  rg_name       = "${var.name_prefix}-rg"
  aci_name      = "${var.name_prefix}-aci"
  acr_name      = replace("${var.name_prefix}acr", "-", "")
  aks_name      = "${var.name_prefix}-aks"
  keyvault_name = "${var.name_prefix}-kv"
  redis_name    = "${var.name_prefix}-redis"

  common_tags = {
    Creator = var.student_email
  }
}