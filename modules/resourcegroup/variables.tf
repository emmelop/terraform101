###############################################################
#
# Miguel LópezG · Technical Challenge
# Challenge #02 . Platform Challenge
# Questions 2.8 . Write a Terraform template that provisions
#                 PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Modules: resource_group
# ##############################################################



variable "resource_group_location" {
  default     = "northeurope"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "storage_account_name_prefix" {
  default     = "st" 
  description = "Prefix of the storage account to guarantee name uniquiness"
}

variable "environment" {
  default = "def"
}