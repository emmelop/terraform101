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

output "delegated_subnet_id_out" {
    description = "delegated_subnet_id"
    value       = azurerm_subnet.backsubnet.id
}

output "subnet_front_id_out" {
    description = "VNet subnet front"
    value       = azurerm_subnet.front.id
}

output "private_dns_zone_id_out" {
    description = "private_dns_zone_id_out"
    value       = azurerm_private_dns_zone.default.id
}

