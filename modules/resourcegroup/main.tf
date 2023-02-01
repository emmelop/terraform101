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
  workspace_env_tag = "-${terraform.workspace}"
}

# Generate random resource group name
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location    = var.resource_group_location
  name        = "${random_pet.rg_name.id}${local.workspace_env_tag}"
  tags = {
    "Environment" = "Environment${local.workspace_env_tag}"
  }
}

resource "random_string" "staccount" {
  length = 6
  special = false
  upper = false
}

resource "azurerm_storage_account" "stmgmnt" {
  name                     = "${lower(var.storage_account_name_prefix)}${random_string.staccount.result}${var.environment}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
  tags = {
    "Purpose" = "Management storage account: Logs and telemetry common shared infrastructure"
    "Env"     = "Environment${local.workspace_env_tag}"
  }
}

resource "azurerm_storage_container" "logcontainer" {
  name                 = "shinfralogs"
  storage_account_name = azurerm_storage_account.stmgmnt.name
}