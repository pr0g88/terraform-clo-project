# =============================================================================
# MOVED-БЛОКИ: миграция state после перехода на for_each (main.tf)
# =============================================================================

moved {
  from = clo_compute_instance.nginx
  to   = clo_compute_instance.standard["nginx"]
}

moved {
  from = clo_compute_instance.gitlab
  to   = clo_compute_instance.critical["gitlab"]
}

moved {
  from = clo_compute_instance.gitlab_runner
  to   = clo_compute_instance.standard["gitlab_runner"]
}

moved {
  from = clo_compute_instance.k8s_master
  to   = clo_compute_instance.standard["k8s_master"]
}

moved {
  from = clo_compute_instance.k8s_node1
  to   = clo_compute_instance.standard["k8s_node1"]
}

moved {
  from = clo_compute_instance.k8s_node2
  to   = clo_compute_instance.standard["k8s_node2"]
}

moved {
  from = clo_compute_instance.postgres
  to   = clo_compute_instance.critical["postgres"]
}

moved {
  from = clo_compute_instance.autotest
  to   = clo_compute_instance.standard["autotest"]
}
