terraform {
  required_providers {
    clo = {
      source  = "registry.terraform.io/clo-ru/clo"
      version = "2.8.0"
    }
  }
}

resource "clo_storage_s3_user" "this" {
  name               = var.user_name
  canonical_name     = var.user_name
  max_buckets        = 10
  user_quota_max_size = 20971520
  project_id         = var.project_id
}

resource "clo_storage_s3_user_keys" "this" {
  user_id = clo_storage_s3_user.this.id
}
