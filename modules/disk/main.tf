terraform {
  required_providers {
    clo = {
      source  = "registry.terraform.io/clo-ru/clo"
      version = "2.8.0"
    }
  }
}

resource "clo_disks_volume" "this" {
  name       = var.disk_name
  size       = var.disk_size
  project_id = var.project_id
}

resource "clo_disks_volume_attach" "this" {
  volume_id   = clo_disks_volume.this.id
  instance_id = var.instance_id
}
