
output "azurerm_lb_id" {
  description = "the id for the azurerm_lb resource"
  value       = "${azurerm_lb.azlb-lb.id}"
}

output "azurerm_lb_name" {
  description = "the name for the azurerm_lb resource"
  value       = "${azurerm_lb.azlb-lb.name}"
}

output "azurerm_lb_backend_address_pool_id" {
  description = "the id for the azurerm_lb_backend_address_pool resource"
  value       = "${azurerm_lb_backend_address_pool.azlb.id}"
}


output "lb_rules" {
  value = "${azurerm_lb_rule.azlb.*.name}"
}

output "lb_rules_frontend_port" {
  value = "${azurerm_lb_rule.azlb.*.frontend_port}"
}

output "lb_rules_backend_port" {
  value = "${azurerm_lb_rule.azlb.*.backend_port}"
}