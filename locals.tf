locals {
  environment = "production"
  managed_by  = "terraform"

  frontend = {
    nginx = { cpu = 1, ram = 2, disk = 10 }
  }

  backend = {
    postgres      = { cpu = 1, ram = 2, disk = 20 }
    gitlab        = { cpu = 4, ram = 8, disk = 80 }
    gitlab_runner = { cpu = 2, ram = 4, disk = 20 }
  }

  kubernetes = {
    master = { cpu = 4, ram = 8, disk = 60 }
    node1  = { cpu = 4, ram = 8, disk = 40 }
  }
}
