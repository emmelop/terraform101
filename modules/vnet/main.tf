###############################################################
#
# Miguel LópezG · Technical Challenge
# Challenge #02 . Platform Challenge
# Questions 2.8 . Write a Terraform template that provisions
#                 PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Module Virtual network and networking basics
# ##############################################################

resource "random_string" "vnet" {
  length = 6
  special = false
  upper = false
}

# Manages the Virtual Network
resource "azurerm_virtual_network" "default" {
  name                = "vnet-scrm-dev"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = ["10.0.0.0/16"]
}

# Manages the MySQL Subnet
resource "azurerm_subnet" "backsubnet" {
  address_prefixes     = ["10.0.2.0/24"]
  name                 = "snet-back"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.default.name
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "fs"

    service_delegation {
      name    = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_subnet" "front" {
  address_prefixes     = ["10.0.1.0/24"]
  name                 = "snet-front"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.default.name
}


# Enables you to manage Private DNS zones within Azure DNS
resource "azurerm_private_dns_zone" "default" {
  name                = "${random_string.vnet.result}.mysql.database.azure.com"
  resource_group_name  = var.resource_group_name
}

# Enables you to manage Private DNS zone Virtual Network Links
resource "azurerm_private_dns_zone_virtual_network_link" "default" {
  name                  = "mysqlfsVnetZone${random_string.vnet.result}.com"
  private_dns_zone_name = azurerm_private_dns_zone.default.name
  resource_group_name  = var.resource_group_name
  virtual_network_id    = azurerm_virtual_network.default.id
}