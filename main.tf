terraform {
  required_version = ">= 1.3"
  required_providers {
    clo = {
      source  = "registry.terraform.io/clo-ru/clo"
      version = "2.8.0"
    }
  }
}

provider "clo" {
  auth_url = "https://api.clo.ru"
  token    = var.clo_api_token
}

# NGINX
resource "clo_compute_instance" "nginx" {
  name         = "nginx-server"
  flavor_vcpus = 2
  flavor_ram   = 4
  image_id     = "35241583-efdb-42a4-bdc4-79a73af6e323"
  project_id   = var.clo_project_id
  keypairs     = var.default_keypair_ids

  block_device {
    bootable     = true
    size         = 10
    storage_type = "volume"
  }

  addresses {
    external        = true
    version         = 4
    ddos_protection = false
  }
}

# GitLab Server
resource "clo_compute_instance" "gitlab" {
  name         = "gitlab-server"
  flavor_vcpus = 4
  flavor_ram   = 12
  image_id     = "35241583-efdb-42a4-bdc4-79a73af6e323"
  project_id   = var.clo_project_id
  keypairs     = var.default_keypair_ids

  block_device {
    bootable     = true
    size         = 80
    storage_type = "volume"
  }

  addresses {
    external        = false
    version         = 4
    ddos_protection = false
  }
}

# GitLab Runner
resource "clo_compute_instance" "gitlab_runner" {
  name         = "gitlab-runner"
  flavor_vcpus = 4
  flavor_ram   = 8
  image_id     = "35241583-efdb-42a4-bdc4-79a73af6e323"
  project_id   = var.clo_project_id
  keypairs     = var.default_keypair_ids

  block_device {
    bootable     = true
    size         = 60
    storage_type = "volume"
  }

  addresses {
    external        = false
    version         = 4
    ddos_protection = false
  }
}

# Kubernetes Master
resource "clo_compute_instance" "k8s_master" {
  name         = "kubernetes-master"
  flavor_vcpus = 4
  flavor_ram   = 8
  image_id     = "35241583-efdb-42a4-bdc4-79a73af6e323"
  project_id   = var.clo_project_id
  keypairs     = var.default_keypair_ids

  block_device {
    bootable     = true
    size         = 60
    storage_type = "volume"
  }

  addresses {
    external        = false
    version         = 4
    ddos_protection = false
  }
}

# Kubernetes Node 1
resource "clo_compute_instance" "k8s_node1" {
  name         = "kubernetes-node1"
  flavor_vcpus = 4
  flavor_ram   = 8
  image_id     = "35241583-efdb-42a4-bdc4-79a73af6e323"
  project_id   = var.clo_project_id
  keypairs     = var.default_keypair_ids

  block_device {
    bootable     = true
    size         = 40
    storage_type = "volume"
  }

  addresses {
    external        = false
    version         = 4
    ddos_protection = false
  }
}

# PostgreSQL
resource "clo_compute_instance" "postgres" {
  name         = "postgres-server"
  flavor_vcpus = 1
  flavor_ram   = 2
  image_id     = "35241583-efdb-42a4-bdc4-79a73af6e323"
  project_id   = var.clo_project_id
  keypairs     = var.default_keypair_ids

  block_device {
    bootable     = true
    size         = 20
    storage_type = "volume"
  }
}

# Autotest Server
resource "clo_compute_instance" "autotest" {
  name         = "autotest-server"
  flavor_vcpus = 6
  flavor_ram   = 12
  image_id     = var.default_image_id
  project_id   = var.clo_project_id
  keypairs     = var.default_keypair_ids

  block_device {
    bootable     = true
    size         = 70
    storage_type = "volume"
  }

  addresses {
    external        = false
    version         = 4
    ddos_protection = false
  }
}
