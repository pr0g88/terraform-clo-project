output "user_id" {
  value = clo_storage_s3_user.this.id
}

output "access_key" {
  value     = clo_storage_s3_user_keys.this.access_key
  sensitive = true
}

output "secret_key" {
  value     = clo_storage_s3_user_keys.this.secret_key
  sensitive = true
}
