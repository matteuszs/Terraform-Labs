terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "97529777-600a-4090-995a-d38a63b5de26"
}

provider "azuread" {
  tenant_id = "16dd9b56-84a8-4b26-b800-741b14debe2f"
}