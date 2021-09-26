resource "azurerm_virtual_network" "test_vnet" {
  name                = "test_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.tf-st-rg14.location
  resource_group_name = data.azurerm_resource_group.tf-st-rg14.name
}

resource "azurerm_subnet" "test_subnet" {
  name                 = "test_subnet"
  resource_group_name  = data.azurerm_resource_group.tf-st-rg14.name
  virtual_network_name = azurerm_virtual_network.test_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "test_nic" {
  name                = "test_nic"
  location            = data.azurerm_resource_group.tf-st-rg14.location
  resource_group_name = data.azurerm_resource_group.tf-st-rg14.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.test_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "mateuszstestvm" {
  name                = "mateuszstestvm"
  resource_group_name = data.azurerm_resource_group.tf-st-rg14.name
  location            = data.azurerm_resource_group.tf-st-rg14.location
  size                = "standard_d4s_v3"
  disable_password_authentication = false

  admin_username = var.username
  admin_password = var.password

  network_interface_ids = [
    azurerm_network_interface.test_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  tags = var.tags
}