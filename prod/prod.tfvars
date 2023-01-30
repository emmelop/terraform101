# ##############################################################
#
# Miguel LópezG · SCRM Technical Challenge: Platform Engineer
# Challenge #02. Platform Challenge
# Questions 2.8. Write a Terraform template that provisions
#                PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Multi-environment deployments: production PROD. vars file
# ##############################################################

environment     = "prod"
location        = "northeurope"
dfault_tags     = {
    ctx-environment = "prod"
    ctx-depoyed_by  = "terraform"
}
address_space   = "10.77.0.0/16"
subnet          = "10.77.20.0/24"