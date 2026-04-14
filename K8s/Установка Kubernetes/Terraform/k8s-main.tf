data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

# === Kubernetes Master нода ===
resource "yandex_compute_instance" "k8s_master" {
  name        = "k8s-master"
  hostname    = "k8s-master"
  platform_id = "standard-v3"
  allow_stopping_for_update = true

  resources {
    cores         = var.k8s_master_cores
    memory        = var.k8s_master_memory
    core_fraction = var.k8s_master_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.k8s_master_disk_size
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_ssh_key}"
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [
      yandex_vpc_security_group.k8s_sg.id
    ]
  }
}

# === Kubernetes Worker ноды ===
resource "yandex_compute_instance" "k8s_workers" {
  count       = var.k8s_workers_count
  name        = "k8s-worker-${count.index + 1}"
  hostname    = "k8s-worker-${count.index + 1}"
  platform_id = "standard-v3"
  allow_stopping_for_update = true

  resources {
    cores         = var.k8s_worker_cores
    memory        = var.k8s_worker_memory
    core_fraction = var.k8s_worker_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.k8s_worker_disk_size
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_ssh_key}"
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [
      yandex_vpc_security_group.k8s_sg.id
    ]
  }
}