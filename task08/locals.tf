locals {
  rg_name       = "${var.name_prefix}-rg"
  aci_name      = "${var.name_prefix}-ci"
  acr_name      = replace("${var.name_prefix}cr", "-", "") # Evaluates to cmtrac643e5vmod8cr
  aks_name      = "${var.name_prefix}-aks"
  keyvault_name = "${var.name_prefix}-kv"
  redis_name    = "${var.name_prefix}-redis"

  common_tags = {
    Creator = var.student_email
  }
}