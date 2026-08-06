variable "clo_api_token" {
  type      = string
  sensitive = true
}

variable "clo_project_id" {
  type    = string
}

variable "default_image_id" {
  type    = string
}

variable "default_keypair_ids" {
  type = list(string)
}