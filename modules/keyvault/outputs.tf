###############################################################
#
# Miguel LópezG · Technical Challenge
# Challenge #02 . Platform Challenge
# Questions 2.8 . Write a Terraform template that provisions
#                 PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Module outputs
# ##############################################################

output "akv_id_out" {
    description = "Azure Key Vault ID needed for create passwords in other resources"
    value       = azurerm_key_vault.scrmkv.id
}