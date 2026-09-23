# Terraform CLO Infrastructure

Управление облачной инфраструктурой [clo.ru](https://clo.ru) через Terraform.

## 🏗️ Архитектура

Точные размеры серверов — единственный источник правды: `locals.tf`
(`local.critical_instances` + `local.standard_instances`). Таблица ниже
для наглядности:

| Сервер | vCPU | RAM | Диск | Назначение | Защита от destroy |
|--------|------|-----|------|------------|--------------------|
| nginx-server | 2 | 4 ГБ | 10 ГБ | Веб-сервер | — |
| postgres-server | 1 | 2 ГБ | 20 ГБ | База данных | ✅ `prevent_destroy` |
| gitlab-server | 4 | 12 ГБ | 80 ГБ | GitLab | ✅ `prevent_destroy` |
| gitlab-runner | 4 | 8 ГБ | 50 ГБ | CI/CD Runner / zot registry / vault server | — |
| kubernetes-master | 4 | 6 ГБ | 60 ГБ | K8s Control Plane | — |
| kubernetes-node1 | 8 | 16 ГБ | 40 ГБ | K8s Worker | — |
| kubernetes-node2 | 8 | 16 ГБ | 40 ГБ | K8s Worker | — |
| autotest-server | 6 | 12 ГБ | 60 ГБ | Автотесты/AppSec | — |

`postgres-server` и `gitlab-server` описаны в `main.tf` отдельным
resource-блоком (`clo_compute_instance.critical`) с
`lifecycle { prevent_destroy = true }` — Terraform откажется их удалить
или пересоздать, пока флаг явно не убран из кода. Это особенно важно,
пока state локальный и без lock (см. «Быстрый старт» — команды
запускаются с `-lock=false`).

## 🪣 S3 хранилище

| Пользователь | Размер | Назначение |
|-------------|--------|------------|
| k8s-storage | 20 ГБ | Хранилище для Kubernetes |

## 📦 Модули

- `modules/compute` — виртуальные машины (сейчас не подключён: серверы в
  `main.tf` создаются напрямую через `for_each` по `locals.tf`, без
  вызова этого модуля)
- `modules/disk` — дополнительные диски (пока не используется ни одним сервером)
- `modules/networking` — IP и Load Balancer (пока не используется)
- `modules/snapshot` — резервное копирование (используется для postgres)
- `modules/s3` — S3-совместимое хранилище (используется для k8s-storage)

## 🖼️ Образ ОС

ID образа для nginx/gitlab/gitlab-runner/kubernetes-*/postgres задаётся
переменной `instance_image_id` (по умолчанию — текущий образ,
захардкоженный ранее в каждом resource-блоке). `autotest-server`
исторически использует отдельную переменную `default_image_id` — это
осознанно оставлено как есть, чтобы не менять уже задеплоенный образ на
этом сервере.

## 🚀 Быстрый старт

```bash
terraform init -plugin-dir=~/.terraform.d/plugins
terraform plan -lock=false
terraform apply -lock=false
```
