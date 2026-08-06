module "afw" {
  source = "./modules/afw"

  unique_id           = var.unique_id
  location            = var.location
  rg_name             = var.rg_name
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  aks_loadbalancer_ip = var.aks_loadbalancer_ip
  public_ip_name      = var.public_ip_name
}