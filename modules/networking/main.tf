terraform {
  required_providers {
    clo = {
      source  = "registry.terraform.io/clo-ru/clo"
      version = "2.8.0"
    }
  }
}

resource "clo_network_ip" "this" {
  count = var.create_ip ? 1 : 0

  ddos_protection = var.ddos_protection
}

resource "clo_network_ip_attach" "this" {
  count = var.create_ip ? 1 : 0

  address_id  = clo_network_ip.this[0].id
  entity_id   = var.instance_id
  entity_name = "server"
}

resource "clo_network_loadbalancer" "this" {
  count = var.create_lb ? 1 : 0

  name       = var.lb_name
  project_id = var.project_id
}
