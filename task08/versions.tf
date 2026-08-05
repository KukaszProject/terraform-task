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
locals {
  # coalesce() ignores nulls and empty strings, securely falling back to localhost during plan
  aks_host = coalesce(try(module.aks.host, ""), "https://127.0.0.1:6443")

  # try() catches decode errors if the certificate values are null before creation
  aks_client_crt = try(base64decode(module.aks.client_certificate), "")
  aks_client_key = try(base64decode(module.aks.client_key), "")
  aks_cluster_ca = try(base64decode(module.aks.cluster_ca_certificate), "")
}

provider "kubectl" {
  host                   = local.aks_host
  client_certificate     = local.aks_client_crt
  client_key             = local.aks_client_key
  cluster_ca_certificate = local.aks_cluster_ca
  load_config_file       = false
}

provider "kubernetes" {
  host                   = local.aks_host
  client_certificate     = local.aks_client_crt
  client_key             = local.aks_client_key
  cluster_ca_certificate = local.aks_cluster_ca
}