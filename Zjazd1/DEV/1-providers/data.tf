data "azuread_user" "my_user_data" {
  user_principal_name = "tf-st14@chmfnd.onmicrosoft.com"
}

data "azurerm_resource_group" "tf-st-rg14" {
  name = "tf-st-rg14"
}