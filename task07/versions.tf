terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  # Force the provider to use the exact subscription from your lab
  subscription_id            = "fe7f3f41-b0fa-47c8-84f7-d5e8ae76595f"
  skip_provider_registration = true
}