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

  subscription_id   = "230046ae-8ad8-4872-a60f-6ea22a6f6fdd"
  tenant_id         = "fd0b1f6e-75e6-4d1a-8d05-dabf4670f6fd"
  client_id         = "627c6815-2de3-4050-954d-f98fd6e5a4e1"
  client_secret     = "Iqt8Q~tQERFlJDLUelH1vqHaqPAqqelJNF8olbsl"
  #client_name       = "svcprincipal-terraform"
}
