variable "disk_name" {
  description = "Имя дополнительного диска"
  type        = string
}

variable "disk_size" {
  description = "Размер диска в ГБ"
  type        = number
}

variable "project_id" {
  description = "ID проекта"
  type        = string
}

variable "instance_id" {
  description = "ID ВМ"
  type        = string
}
