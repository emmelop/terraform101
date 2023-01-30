# ##############################################################
#
# Miguel LópezG · SCRM Technical Challenge: Platform Engineer
# Challenge #02. Platform Challenge
# Questions 2.8. Write a Terraform template that provisions
#                PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Main tf deployment
# ##############################################################


locals {
  tags = {
    ctx-environment   = "dev"
    ctx-department    = "scrm"
    ctx-source        = "terraform"
  }


module "resource_group" {
  #source    = "terraform-azurerm-modules/resource-group/azurerm"
  source    = "./modules/resourcegroup"
  version   = "3.0.0"
  name      = "example-group"
  location  = "northeurope"
  tags      = merge(local.tags, {
    ctx-workload = "challenge-02"
    sec-sensitivity = "C2"
  } 
}

/*
module "key_vault" {
  source = "terraform-azurerm-modules/keyvault/azurerm"
  version = "3.0.0"
  name = "example-vault"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  sku_name = "standard"
}

module "storage_account" {
  source = "terraform-azurerm-modules/storage-account/azurerm"
  version = "3.0.0"
  name = "examplaountst23"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  account_kind = "StorageV2"
  account_tier = "Standard"
}

module "virtual_network" {
  source = "terraform-azurerm-modules/network/azurerm"
  version = "3.0.0"
  name = "example-network"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  address_space = ["10.0.0.0/16"]

  subnet_names = ["subnet1", "subnet2"]
  subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "postgresql_server" {
  source = "terraform-azurerm-modules/postgresql/azurerm"
  version = "3.0.0"
  name = "example-postgresql"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  virtual_network_subnet_id = module.virtual_network.subnets[0].id

  administrator_login = "exampleuser"
  administrator_login_password = "examplepassword"
}

*/