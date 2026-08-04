tags = {
  Creator = "lukasz_kielbasa@epam.com"
}

verification_agent_ip = "18.153.146.156"

resource_groups = {
  rg1 = { name = "cmaz-ac643e5v-mod5-rg-01", location = "West Europe" }
  rg2 = { name = "cmaz-ac643e5v-mod5-rg-02", location = "North Europe" }
  rg3 = { name = "cmaz-ac643e5v-mod5-rg-03", location = "East US" }
}

app_service_plans = {
  asp1 = { name = "cmaz-ac643e5v-mod5-asp-01", worker_count = 2, sku = "S1", rg_key = "rg1" }
  asp2 = { name = "cmaz-ac643e5v-mod5-asp-02", worker_count = 1, sku = "S1", rg_key = "rg2" }
}

app_services = {
  app1 = { name = "cmaz-ac643e5v-mod5-app-01", asp_key = "asp1", rg_key = "rg1" }
  app2 = { name = "cmaz-ac643e5v-mod5-app-02", asp_key = "asp2", rg_key = "rg2" }
}