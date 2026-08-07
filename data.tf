data "clo_project_images" "available" {
  project_id = var.clo_project_id
}

data "clo_compute_snapshots" "existing" {
  project_id = var.clo_project_id
}
