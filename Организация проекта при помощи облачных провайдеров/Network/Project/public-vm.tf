data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "public_vm" {
  name        = "public-vm"
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
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true   # публичный IP
    security_group_ids = [
      yandex_vpc_security_group.ssh_allowed.id
    ]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_ssh_key}"
  }

  scheduling_policy {
    preemptible = true
  }
}