variable "clo_api_token" {
  type      = string
  sensitive = true
}

variable "clo_project_id" {
  type = string
}

variable "default_image_id" {
  type = string
}

variable "default_keypair_ids" {
  type = list(string)
}

# NGINX
variable "nginx_cpu" {
  type    = number
  default = 2
}

variable "nginx_ram_mb" {
  type    = number
  default = 2048
}

variable "nginx_disk_size" {
  type    = number
  default = 25
}

# PostgreSQL
variable "pg_cpu" {
  type    = number
  default = 4
}

variable "pg_ram_mb" {
  type    = number
  default = 8192
}

variable "pg_disk_size" {
  type    = number
  default = 50
}