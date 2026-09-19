terraform {
  required_version = ">= 1.3"
  required_providers {
    clo = {
      source  = "registry.terraform.io/clo-ru/clo"
      version = "2.8.0"
    }
  }
}

provider "clo" {
  auth_url = "https://api.clo.ru"
  token    = var.clo_api_token
}

# =============================================================================
# КРИТИЧНЫЕ СЕРВЕРЫ (postgres, gitlab)
# =============================================================================
# Отдельный resource-блок с lifecycle.prevent_destroy = true: Terraform
# откажется удалять/пересоздавать эти ВМ (например, из-за случайной смены
# image_id/размера или ручного terraform destroy), пока флаг не будет
# осознанно убран из кода. Это особенно важно при локальном state без
# lock и без remote backend, где ошибиться легче всего.
#
# Данные о размерах серверов берутся из local.critical_instances
# (locals.tf) — это единственный источник правды, README на него
# опирается, а не дублирует цифры вручную.
# =============================================================================
resource "clo_compute_instance" "critical" {
  for_each = local.critical_instances

  name         = each.value.name
  flavor_vcpus = each.value.cpu
  flavor_ram   = each.value.ram
  image_id     = each.value.image_id
  project_id   = var.clo_project_id
  keypairs     = var.default_keypair_ids

  block_device {
    bootable     = true
    size         = each.value.disk
    storage_type = "volume"
  }

  # У postgres исторически нет внешнего адреса вообще (external = null
  # в locals.tf) — блок addresses для него не рендерится, как и раньше.
  dynamic "addresses" {
    for_each = each.value.external != null ? [1] : []
    content {
      external        = each.value.external
      version         = 4
      ddos_protection = false
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

# =============================================================================
# ОСТАЛЬНЫЕ СЕРВЕРЫ (nginx, gitlab-runner, kubernetes-*, autotest)
# =============================================================================
# Единый for_each вместо восьми скопированных resource-блоков: раньше
# каждый сервер описывался отдельным ресурсом с ручным копированием
# аргументов, из-за чего README/locals.tf разъезжались с реальными
# значениями в main.tf. Теперь размеры серверов берутся из
# local.standard_instances — правим их в одном месте.
# =============================================================================
resource "clo_compute_instance" "standard" {
  for_each = local.standard_instances

  name         = each.value.name
  flavor_vcpus = each.value.cpu
  flavor_ram   = each.value.ram
  image_id     = each.value.image_id
  project_id   = var.clo_project_id
  keypairs     = var.default_keypair_ids

  block_device {
    bootable     = true
    size         = each.value.disk
    storage_type = "volume"
  }

  dynamic "addresses" {
    for_each = each.value.external != null ? [1] : []
    content {
      external        = each.value.external
      version         = 4
      ddos_protection = false
    }
  }
}
