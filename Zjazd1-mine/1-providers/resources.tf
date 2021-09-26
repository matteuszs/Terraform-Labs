resource "azurerm_storage_account" "examplemssa" {
  name                     = "examplemssa"
  resource_group_name      = data.azurerm_resource_group.tf-st-rg14.name
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account" "manualcreated" {
  name                     = "manualcreated"
  resource_group_name      = data.azurerm_resource_group.tf-st-rg14.name
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}