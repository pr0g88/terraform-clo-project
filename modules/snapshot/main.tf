terraform {
  required_providers {
    clo = {
      source  = "registry.terraform.io/clo-ru/clo"
      version = "2.8.0"
    }
  }
}

resource "clo_compute_snapshot" "this" {
  server_id = var.server_id
  name      = "${var.instance_name}-snapshot"
}
