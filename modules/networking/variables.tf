variable "create_ip" {
  description = "Создать публичный IP"
  type        = bool
  default     = false
}

variable "ddos_protection" {
  description = "DDoS защита"
  type        = bool
  default     = false
}

variable "instance_id" {
  description = "ID ВМ"
  type        = string
  default     = ""
}

variable "create_lb" {
  description = "Создать Load Balancer"
  type        = bool
  default     = false
}

variable "lb_name" {
  description = "Имя Load Balancer"
  type        = string
  default     = ""
}

variable "project_id" {
  description = "ID проекта"
  type        = string
  default     = ""
}
