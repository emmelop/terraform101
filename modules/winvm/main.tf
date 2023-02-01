###############################################################
#
# Miguel LópezG · Technical Challenge
# Challenge #02 . Platform Challenge
# Questions 2.8 . Write a Terraform template that provisions
#                 PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Module Virtual Machine main
# ##############################################################

resource "azurerm_network_interface" "adapter" {
  name                = "vmfront-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_front_id
    private_ip_address_allocation = "Dynamic"
  }
}

#Create KeyVault VM random password
resource "random_password" "vmpassword" {
  length = 20
  special = true
}
#Create Key Vault Secret
resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "winvmpassword"
  value        = random_password.vmpassword.result
  key_vault_id = var.azurekeyvault_id
}

resource "azurerm_windows_virtual_machine" "vmfront" {
  name                = "winvmfront01"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_B2ms"
  admin_username      = "adminlopezg"
  admin_password      = azurerm_key_vault_secret.vmpassword.value
  network_interface_ids = [
    azurerm_network_interface.adapter.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}
