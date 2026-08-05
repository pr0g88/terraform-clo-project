variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "flavor_vcpus" {
  description = "Количество vCPU"
  type        = number
}

variable "flavor_ram" {
  description = "RAM в МБ"
  type        = number
}

variable "image_id" {
  description = "ID образа ОС"
  type        = string
}

variable "project_id" {
  description = "ID проекта"
  type        = string
}

variable "keypair_ids" {
  description = "Список ID SSH-ключей"
  type        = list(string)
  default     = []
}

variable "disk_size" {
  description = "Размер диска в ГБ"
  type        = number
  default     = 25
}

variable "external_ip" {
  description = "Нужен ли внешний IP"
  type        = bool
  default     = false
}