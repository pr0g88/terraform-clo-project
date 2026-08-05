terraform {
  required_providers {
    clo = {
      source  = "registry.terraform.io/clo-ru/clo"
      version = "2.8.0"
    }
  }
}

resource "clo_compute_instance" "this" {
  name         = var.vm_name
  flavor_vcpus = var.flavor_vcpus
  flavor_ram   = var.flavor_ram
  image_id     = var.image_id
  project_id   = var.project_id
  keypairs     = var.keypair_ids

  block_device {
    bootable     = true
    size         = var.disk_size
    storage_type = "volume"
  }

  addresses {
    external = var.external_ip
    version  = 4
    ddos_protection = false
  }
}