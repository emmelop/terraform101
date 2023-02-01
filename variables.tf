# ##############################################################
#
# Miguel LópezG · SCRM Technical Challenge: Platform Engineer
# Challenge #02. Platform Challenge
# Questions 2.8. Write a Terraform template that provisions
#                PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Variables file
# ##############################################################

/* 
variable "location" {
  default     = "northeurope"
  description = "Location of the deployment"
}

variable "resource_group_location" {
  default     = "northeurope"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}
 */
variable region {
  default = "northeurope"
}
variable location {
  default = "northeurope"
}
variable "rg-prefix" {
  default = "rg-default"
  description = "Prefix identifying the resource group and the environment"
}