###############################################################
#
# Miguel LópezG · Technical Challenge
# Challenge #02 . Platform Challenge
# Questions 2.8 . Write a Terraform template that provisions
#                 PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Module MySQL Server + DB main
# ##############################################################

resource "random_string" "vnet" {
  length = 6
  special = false
  upper = false
}

#Create KeyVault VM random password
resource "random_password" "password" {
  length = 20
  special = true
}
#Create Key Vault Secret
resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "mysqlpassword"
  value        = random_password.password.result
  key_vault_id = var.azurekeyvault_id
}


# Manages the MySQL Flexible Server
resource "azurerm_mysql_flexible_server" "default" {
  location                     = var.location
  name                         = "mysqlfs-${random_string.vnet.result}"
  resource_group_name          = var.resource_group_name
  administrator_login          = "mysqladmin"
  administrator_password       = random_password.password.result
  backup_retention_days        = 7
  delegated_subnet_id          = var.delegated_subnet_id
  geo_redundant_backup_enabled = false
  private_dns_zone_id          = var.private_dns_zone_id
  sku_name                     = "GP_Standard_D2ds_v4"
  version                      = "8.0.21"
  zone                         = "1"

  high_availability {
    mode                      = "ZoneRedundant"
    standby_availability_zone = "2"
  }
  maintenance_window {
    day_of_week  = 0
    start_hour   = 8
    start_minute = 0
  }
  storage {
    iops    = 360
    size_gb = 20
  }
}


