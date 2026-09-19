locals {
  environment = "production"
  managed_by  = "terraform"

  # Критичные серверы: БД и GitLab. Держим их в отдельном resource-блоке
  # (main.tf) с lifecycle.prevent_destroy = true, чтобы случайный
  # terraform destroy/apply не мог их снести.
  critical_instances = {
    gitlab = {
      name     = "gitlab-server"
      cpu      = 4
      ram      = 12
      disk     = 80
      external = false
      image_id = var.instance_image_id
    }
    postgres = {
      name     = "postgres-server"
      cpu      = 1
      ram      = 2
      disk     = 20
      external = null # исходно без блока addresses — внешний IP не выдаётся
      image_id = var.instance_image_id
    }
  }

  # Остальные серверы — пересоздание допустимо без ручной защиты
  standard_instances = {
    nginx = {
      name     = "nginx-server"
      cpu      = 2
      ram      = 4
      disk     = 10
      external = true
      image_id = var.instance_image_id
    }
    gitlab_runner = {
      name     = "gitlab-runner"
      cpu      = 4
      ram      = 8
      disk     = 50
      external = false
      image_id = var.instance_image_id
    }
    k8s_master = {
      name     = "kubernetes-master"
      cpu      = 4
      ram      = 6
      disk     = 60
      external = false
      image_id = var.instance_image_id
    }
    k8s_node1 = {
      name     = "kubernetes-node1"
      cpu      = 8
      ram      = 16
      disk     = 40
      external = false
      image_id = var.instance_image_id
    }
    k8s_node2 = {
      name     = "kubernetes-node2"
      cpu      = 8
      ram      = 16
      disk     = 40
      external = false
      image_id = var.instance_image_id
    }
    autotest = {
      name     = "autotest-server"
      cpu      = 6
      ram      = 12
      disk     = 60
      external = false
      # автотест исторически использует отдельный образ (var.default_image_id),
      # а не общий var.instance_image_id — поведение сохранено как было
      image_id = var.default_image_id
    }
  }
}
