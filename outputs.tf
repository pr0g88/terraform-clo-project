# Выводим id всех серверов. Критичные (postgres, gitlab) лежат в
# clo_compute_instance.critical[...], остальные — в .standard[...],
# см. main.tf и locals.tf.
output "nginx_id" {
  value = clo_compute_instance.standard["nginx"].id
}

output "gitlab_id" {
  value = clo_compute_instance.critical["gitlab"].id
}

output "gitlab_runner_id" {
  value = clo_compute_instance.standard["gitlab_runner"].id
}

output "k8s_master_id" {
  value = clo_compute_instance.standard["k8s_master"].id
}

output "k8s_node1_id" {
  value = clo_compute_instance.standard["k8s_node1"].id
}

# Раньше kubernetes-node2 был в main.tf, но для него не было output —
# добавлено для симметрии с node1.
output "k8s_node2_id" {
  value = clo_compute_instance.standard["k8s_node2"].id
}

output "postgres_id" {
  value = clo_compute_instance.critical["postgres"].id
}

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
  value = clo_compute_instance.standard["autotest"].id
}
