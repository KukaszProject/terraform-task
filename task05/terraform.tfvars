resource_groups = {
  rg1 = {
    name     = "cmaz-ac643e5v-mod5-rg-01"
    location = "East US"
  }
  rg2 = {
    name     = "cmaz-ac643e5v-mod5-rg-02"
    location = "West US"
  }
  rg3 = {
    name     = "cmaz-ac643e5v-mod5-rg-03"
    location = "Central US"
  }
}

app_service_plans = {
  asp1 = {
    name         = "cmaz-ac643e5v-mod5-asp-01"
    rg_key       = "rg1"
    sku_name     = "S1"
    worker_count = 2
  }
  asp2 = {
    name         = "cmaz-ac643e5v-mod5-asp-02"
    rg_key       = "rg2"
    sku_name     = "S1"
    worker_count = 1
  }
}

app_services = {
  app1 = {
    name    = "cmaz-ac643e5v-mod5-app-01"
    rg_key  = "rg1"
    asp_key = "asp1"
    ip_restrictions = [
      {
        name       = "allow-ip"
        ip_address = "18.153.146.156/32"
        action     = "Allow"
        priority   = 100
      },
      {
        name        = "allow-tm"
        service_tag = "AzureTrafficManager"
        action      = "Allow"
        priority    = 110
      }
    ]
  }
  app2 = {
    name    = "cmaz-ac643e5v-mod5-app-02"
    rg_key  = "rg2"
    asp_key = "asp2"
    ip_restrictions = [
      {
        name       = "allow-ip"
        ip_address = "18.153.146.156/32"
        action     = "Allow"
        priority   = 100
      },
      {
        name        = "allow-tm"
        service_tag = "AzureTrafficManager"
        action      = "Allow"
        priority    = 110
      }
    ]
  }
}

traffic_manager = {
  name           = "cmaz-ac643e5v-mod5-traf"
  rg_key         = "rg3"
  routing_method = "Performance"
}

tags = {
  Creator = "lukasz_kielbasa@epam.com"
}