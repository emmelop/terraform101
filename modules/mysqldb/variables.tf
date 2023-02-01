###############################################################
#
# Miguel LópezG · Technical Challenge
# Challenge #02 . Platform Challenge
# Questions 2.8 . Write a Terraform template that provisions
#                 PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Module MySQL Server + DB variables
# ##############################################################


variable "location" {
  default     = "northeurope"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = ""
  description = "Resource group name"
}

variable "delegated_subnet_id" {
    description = "delegated_subnet_id"
    default     = ""
}

variable "private_dns_zone_id" {
    description = "private_dns_zone_id"
    default     = ""
}

variable "azurekeyvault_id" {
    description = ".azurekeyvault_id"
    default     = ""
}