module "s3_kubernetes" {
  source = "./modules/s3"

  user_name  = "k8s-storage"
  project_id = var.clo_project_id
}
