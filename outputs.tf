###############################################################
#
# Miguel LópezG · Technical Challenge
# Challenge #02 . Platform Challenge
# Questions 2.8 . Write a Terraform template that provisions
#                 PostgreSQL DB and a VPN in a VNet
#
# 2023/01/28
# Main tf deployment
# ##############################################################


output "stgactname" {
  value = module.resource_group.stg_act_name_out
}
output "rgname" {
  value = module.resource_group.rg_name_out
}
output "rglocation" {
  value = module.resource_group.rg_location_out
}