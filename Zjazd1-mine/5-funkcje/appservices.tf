resource "azurerm_app_service_plan" "mateuszsappplan" {
  name                = "mateuszsappplan"
  location            = data.azurerm_resource_group.tf-st-rg14.location
  resource_group_name = data.azurerm_resource_group.tf-st-rg14.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "mateuszsappservice" {
  for_each = var.app_names

  name                = each.value
  location            = data.azurerm_resource_group.tf-st-rg14.location
  resource_group_name = data.azurerm_resource_group.tf-st-rg14.name
  app_service_plan_id = azurerm_app_service_plan.mateuszsappplan.id

  site_config {
    dotnet_framework_version = each.value == "mz-ntoebook-app" ? "v2.0" : "v4.0"
    scm_type                 = "LocalGit"
  }

  tags = {
      creation_date = timestamp()
  }
}