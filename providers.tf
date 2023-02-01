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
  subscription_id   = "8fa9018b-616d-407d-8c95-5b793c7178ae"
  tenant_id         = "35069d74-1489-4194-80c7-3a81385ead5b"
  client_id         = "2bdcb9e1-48f7-47d8-8429-c611a89be18a"
  client_secret     = "cut8Q~eVzFd5kcwg-1eZc-ZWV~zXG6ip3inGUau_"
  #client_name       = "terraform-deployments-2301"
}
