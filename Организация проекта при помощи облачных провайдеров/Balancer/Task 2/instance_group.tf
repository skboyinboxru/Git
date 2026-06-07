resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "yandex_compute_instance_group" "lamp_group" {
  name        = "lamp-group"
  description = "Group of 3 LAMP instances"
  folder_id   = var.folder_id

  instance_template {
    platform_id = "standard-v3"
    resources {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }

    boot_disk {
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"   # LAMP образ
        size     = 10
      }
    }

    network_interface {
      subnet_ids = [data.yandex_vpc_subnet.public.id]
      nat        = true
    }

    metadata = {
      user-data = templatefile("${path.module}/lamp_user_data.tftpl", {
        image_url = local.image_url
        hostname  = "lamp-${random_string.suffix.result}"
      })
      ssh-keys = "ubuntu:${local.public_ssh_key}"
    }

    scheduling_policy {
      preemptible = false
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = [var.default_zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_creating    = 2
    max_expansion   = 2
    startup_duration = 30
  }

  health_check {
    interval = 10
    timeout  = 5
    http_options {
      port = 80
      path = "/"
    }
  }

  load_balancer {
    target_group_name        = "lamp-target-group"
    target_group_description = "Target group for LAMP"
  }
}