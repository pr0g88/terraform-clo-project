# Terraform CLO Infrastructure

Управление облачной инфраструктурой [clo.ru](https://clo.ru) через Terraform.

## 🏗️ Архитектура

| Сервер | vCPU | RAM | Диск | Назначение |
|--------|------|-----|------|------------|
| nginx-server | 1 | 2 ГБ | 10 ГБ | Веб-сервер |
| postgres-server | 1 | 2 ГБ | 20 ГБ | База данных |
| gitlab-server | 4 | 8 ГБ | 80 ГБ | GitLab |
| gitlab-runner | 2 | 4 ГБ | 20 ГБ | CI/CD Runner |
| kubernetes-master | 4 | 8 ГБ | 60 ГБ | K8s Control Plane |
| kubernetes-node1 | 4 | 8 ГБ | 40 ГБ | K8s Worker |

## 📦 Модули

- `modules/compute` — виртуальные машины
- `modules/disk` — дополнительные диски
- `modules/networking` — IP и Load Balancer
- `modules/snapshot` — резервное копирование

## 🚀 Быстрый старт

```bash
terraform init -plugin-dir=~/.terraform.d/plugins
terraform plan -lock=false
terraform apply -lock=false
