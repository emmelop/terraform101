# ##############################################################
#
# Miguel LópezG · SCRM Technical Challenge: Platform Engineer
# Challenge #02. Platform Challenge
# Questions 2.8. Write a Terraform template that provisions
#                PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Providers
# ##############################################################


terraform {
  required_version = ">=1.0"
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {
      key_vault {
        purge_soft_deleted_secrets_on_destroy = true
        recover_soft_deleted_secrets          = true
    }
  }

  #"VSE-MPN-SEP22"
  subscription_id   = "fa9013c7178ae"
  tenant_id         = "69d74-1489b"
  client_id         = "-c611a89be18a"
  client_secret     = "_"
  #client_name       = "terraform-deployments-2301"
}
