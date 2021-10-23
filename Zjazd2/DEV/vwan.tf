resource "azurerm_virtual_wan" "vwan" {
  name                = "vwan"
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
}