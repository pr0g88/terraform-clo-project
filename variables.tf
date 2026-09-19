variable "clo_api_token" {
  description = "API-токен clo.ru для аутентификации провайдера (хранится только в terraform.tfvars, в git не коммитится)"
  type        = string
  sensitive   = true
}

variable "clo_project_id" {
  description = "ID проекта в clo.ru, в котором создаются все ресурсы (серверы, диски, S3, снапшоты)"
  type        = string
}

variable "default_image_id" {
  description = "ID образа ОС для autotest-сервера. Исторически задаётся отдельно от остальных серверов (см. var.instance_image_id) — оставлено как есть, чтобы не менять уже задеплоенный образ на autotest-server"
  type        = string
}

variable "default_keypair_ids" {
  description = "Список ID SSH-ключей clo.ru, которые добавляются на все создаваемые виртуальные машины"
  type        = list(string)
}

variable "instance_image_id" {
  description = "ID образа ОС по умолчанию для всех серверов, кроме autotest (nginx, gitlab, gitlab-runner, kubernetes-*, postgres). Раньше был захардкожен в каждом resource-блоке в main.tf — вынесен в переменную, чтобы менять образ в одном месте. Значение по умолчанию равно тому UUID, что уже был захардкожен, поэтому apply не должен ничего пересоздавать"
  type        = string
  default     = "35241583-efdb-42a4-bdc4-79a73af6e323"
}
