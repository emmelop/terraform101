###############################################################
#
# Miguel LópezG · Technical Challenge
# Challenge #02 . Platform Challenge
# Questions 2.8 . Write a Terraform template that provisions
#                 PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Main tf deployment
# ##############################################################

locals {
  #location = var.location == null ? data.azurerm_resource_group.vm[0].location : var.location
  tags = {
    ctx-department    = "scrm"
    ctx-source        = "terraform"
  }
 }

module "resource_group" {
  #source    = "terraform-azurerm-modules/resource-group/azurerm"
  source    = "./modules/resourcegroup"
}

module "key_vault" {
  depends_on              = [ module.resource_group ]
  source                  = "./modules/keyvault"
  resource_group_name     = module.resource_group.rg_name_out
  resource_group_location = module.resource_group.rg_location_out
}

module "virtual_network" {
  source = "./modules/vnet"
  resource_group_name     = module.resource_group.rg_name_out
  resource_group_location = module.resource_group.rg_location_out
 }

module "mysql_server" {
  depends_on          = [module.virtual_network, module.key_vault]
  source              = "./modules/mysqldb"
  resource_group_name = module.resource_group.rg_name_out
  location            = module.resource_group.rg_location_out
  delegated_subnet_id = module.virtual_network.delegated_subnet_id_out
  private_dns_zone_id = module.virtual_network.private_dns_zone_id_out
  azurekeyvault_id    = module.key_vault.akv_id_out
}

module "compute_vm_fpront" {
  depends_on          = [module.virtual_network, module.key_vault]
  source              = "./modules/winvm"
  resource_group_name = module.resource_group.rg_name_out
  location            = module.resource_group.rg_location_out
  subnet_front_id     = module.virtual_network.subnet_front_id_out
  private_dns_zone_id = module.virtual_network.private_dns_zone_id_out
  azurekeyvault_id    = module.key_vault.akv_id_out
} 