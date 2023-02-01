terraform {
  backend "azurerm" {
    resource_group_name   = "rg-tf-multitstate"
    storage_account_name  = "sttfmultitstate19648"
    container_name        = "tf-multitstate"
    key                   = "xxx"
  }
}
