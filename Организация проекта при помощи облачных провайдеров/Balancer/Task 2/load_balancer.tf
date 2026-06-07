resource "yandex_lb_network_load_balancer" "lamp_balancer" {
  name = "lamp-balancer"

  listener {
    name = "http-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.lamp_group.load_balancer[0].target_group_id

    healthcheck {
      name = "http"
      interval = 10
      timeout  = 5
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}