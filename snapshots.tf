module "snapshot_postgres" {
  source = "./modules/snapshot"

  server_id     = clo_compute_instance.postgres.id
  instance_name = clo_compute_instance.postgres.name
}
