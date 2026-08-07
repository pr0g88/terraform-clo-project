output "public_ip" {
  value = var.create_ip ? clo_network_ip.this[0].address : null
}

output "lb_id" {
  value = var.create_lb ? clo_network_loadbalancer.this[0].id : null
}
