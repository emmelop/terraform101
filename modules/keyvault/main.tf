###############################################################
#
# Miguel LópezG · Technical Challenge
# Challenge #02 . Platform Challenge
# Questions 2.8 . Write a Terraform template that provisions
#                 PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Module Keyvault for secrets
# ##############################################################

# Key vault for VM Password
resource "random_id" "kvault" {
    byte_length = 5
    prefix = "keyvault"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "scrmkv" {
  name                        = random_id.kvault.hex
  resource_group_name         = var.resource_group_name
  location                    = var.resource_group_location
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "Get",
    ]
    secret_permissions = [
      "Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set",
    ]
    storage_permissions = [
      "Get",
    ]
  }
}


