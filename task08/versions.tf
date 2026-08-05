terraform {
  required_version = ">= 1.5.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.110.0, < 4.0.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = ">= 2.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

provider "kubectl" {
  host                   = coalesce(module.aks.host, "https://127.0.0.1:6443")
  client_certificate     = base64decode(coalesce(module.aks.client_certificate, "ZHVtbXk="))
  client_key             = base64decode(coalesce(module.aks.client_key, "ZHVtbXk="))
  cluster_ca_certificate = base64decode(coalesce(module.aks.cluster_ca_certificate, "ZHVtbXk="))
  load_config_file       = false
}

provider "kubernetes" {
  host                   = coalesce(module.aks.host, "https://127.0.0.1:6443")
  client_certificate     = base64decode(coalesce(module.aks.client_certificate, "ZHVtbXk="))
  client_key             = base64decode(coalesce(module.aks.client_key, "ZHVtbXk="))
  cluster_ca_certificate = base64decode(coalesce(module.aks.cluster_ca_certificate, "ZHVtbXk="))
}