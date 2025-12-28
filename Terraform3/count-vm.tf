data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}


resource "yandex_compute_instance" "web" {
  count = 2
  
  name        = "web-${count.index+1}"
  hostname    = "web-${count.index+1}" # для fqdn
  platform_id = "standard-v3"
allow_stopping_for_update = true
  resources {
    cores = var.vm_web_cores
    memory = var.vm_web_memory
    core_fraction = var.vm_web_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }   
  }

  

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [
        yandex_vpc_security_group.example.id
    ]
  }
depends_on = [yandex_compute_instance.db_vm]
}
