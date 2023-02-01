terraform {
  backend "azurerm" {
    resource_group_name   = "rg-tf-multitstate"
    storage_account_name  = "sttfmultitstate19648"
    container_name        = "tf-multitstate"
    key                   = "EG+HxMWvOV22qFeeY2wQYejxGT/5M2dqYFFt+Ikc0/KjSmW+aKqo4eSftW54d4/AsAe0ZmejNZK0+AStX8RMBg=="
  }
}