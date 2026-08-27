output "nginx_id"       { value = clo_compute_instance.nginx.id }
output "gitlab_id"      { value = clo_compute_instance.gitlab.id }
output "gitlab_runner_id" { value = clo_compute_instance.gitlab_runner.id }
output "k8s_master_id"  { value = clo_compute_instance.k8s_master.id }
output "k8s_node1_id"   { value = clo_compute_instance.k8s_node1.id }
output "postgres_id"    { value = clo_compute_instance.postgres.id }

output "snapshot_postgres" {
  value = {
    id   = module.snapshot_postgres.snapshot_id
    name = module.snapshot_postgres.snapshot_name
  }
}

output "s3_user_id" {
  value = module.s3_kubernetes.user_id
}

output "autotest_id" {
  value = clo_compute_instance.autotest.id
}