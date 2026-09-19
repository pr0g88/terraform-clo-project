# Снапшот postgres теперь ссылается на clo_compute_instance.critical["postgres"]
# (было clo_compute_instance.postgres до перехода на for_each, см. moved.tf).
module "snapshot_postgres" {
  source = "./modules/snapshot"

  server_id     = clo_compute_instance.critical["postgres"].id
  instance_name = clo_compute_instance.critical["postgres"].name
}
