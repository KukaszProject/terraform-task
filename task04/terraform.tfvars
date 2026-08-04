resource_group_name = "cmaz-ac643e5v-mod4-rg"
location            = "West US 2"
vnet_name           = "cmaz-ac643e5v-mod4-vnet"
subnet_name         = "frontend"
nic_name            = "cmaz-ac643e5v-mod4-nic"
nsg_name            = "cmaz-ac643e5v-mod4-nsg"
nsg_rule_http       = "AllowHTTP"
nsg_rule_ssh        = "AllowSSH"
public_ip           = "cmaz-ac643e5v-mod4-pip"
domain_name_label   = "cmaz-ac643e5v-mod4-nginx"
vm_name             = "cmaz-ac643e5v-mod4-vm"
vm_os_version       = "server"
vm_SKU              = "Standard_B2s_v2"

tags = {
  Creator = "lukasz_kielbasa@epam.com"
}