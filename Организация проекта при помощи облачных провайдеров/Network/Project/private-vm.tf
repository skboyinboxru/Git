resource "yandex_compute_instance" "private_vm" {
  name        = "private-vm"
  platform_id = "standard-v3"
  zone        = var.default_zone

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = false
  }

  metadata = {
    user-data = <<-EOF
      #!/bin/bash
      mkdir -p /home/ubuntu/.ssh
      echo "${local.public_ssh_key}" >> /home/ubuntu/.ssh/authorized_keys
      chmod 700 /home/ubuntu/.ssh
      chmod 600 /home/ubuntu/.ssh/authorized_keys
      chown -R ubuntu:ubuntu /home/ubuntu/.ssh
    EOF
  }

  scheduling_policy {
    preemptible = true
  }
}