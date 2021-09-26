terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tf-st-rg14"
    storage_account_name = "mateuszstfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "97529777-600a-4090-995a-d38a63b5de26"
}

resource "azurerm_storage_account" "examplemssa" {
  name                     = "examplemssa"
  resource_group_name      = "tf-st-rg14"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}