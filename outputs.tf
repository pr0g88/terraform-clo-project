output "nginx_id" {
  value = clo_compute_instance.nginx.id
}

output "postgresql_id" {
  value = clo_compute_instance.postgresql.id
}

output "gitlab_id" {
  value = clo_compute_instance.gitlab.id
}

output "gitlab_runner_id" {
  value = clo_compute_instance.gitlab_runner.id
}