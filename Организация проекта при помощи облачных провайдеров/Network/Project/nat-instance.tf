data "yandex_compute_image" "nat" {
  image_id = var.nat_image_id
}

resource "yandex_compute_instance" "nat" {
  name        = "nat-instance"
  platform_id = "standard-v2"
  zone        = var.default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.nat.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    ip_address = "192.168.10.254"   # строго по заданию
    nat        = true               # публичный IP для выхода в интернет
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_ssh_key}"
  }

  # Если образ NAT не настроен на IP-форвардинг, раскомментировать user-data:
  # user-data = <<-EOF
  #   #!/bin/bash
  #   sysctl -w net.ipv4.ip_forward=1
  #   iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
  # EOF
}