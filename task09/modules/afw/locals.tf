locals {
  # Naming convention: ${var.unique_id}-<abbreviation>
  afw_name = lower("${var.unique_id}-afw")
  pip_name = lower("${var.unique_id}-pip")

  # Resolving your missing local references:
  route_table_name = lower("${var.unique_id}-rt")
  net_rc_name      = lower("${var.unique_id}-fwrcn")
  app_rc_name      = lower("${var.unique_id}-fwrca")
  nat_rc_name      = lower("${var.unique_id}-fwrcnat")

  # Rule definitions for the dynamic block
  network_rules = {
    aks_udp = {
      protocols = ["UDP"]
      ports     = ["1194", "123", "53"]
    }
    aks_tcp = {
      protocols = ["TCP"]
      ports     = ["443", "9000", "80"]
    }
  }
}