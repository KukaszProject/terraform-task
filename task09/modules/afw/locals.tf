locals {
  # Naming convention variables (keep your existing ones here)
  afw_name         = lower("${var.unique_id}-afw")
  pip_name         = lower("${var.unique_id}-pip")
  route_table_name = lower("${var.unique_id}-rt")
  net_rc_name      = lower("${var.unique_id}-fwrcn")
  app_rc_name      = lower("${var.unique_id}-fwrca")
  nat_rc_name      = lower("${var.unique_id}-fwrcnat")

  # Add this map for the loop
  net_rules = {
    aks_tcp = {
      name      = "allow-aks-tcp"
      protocols = ["TCP"]
      ports     = ["80", "443", "9000"]
    }
    aks_udp = {
      name      = "allow-aks-udp"
      protocols = ["UDP"]
      ports     = ["53", "123", "1194"]
    }
  }
}