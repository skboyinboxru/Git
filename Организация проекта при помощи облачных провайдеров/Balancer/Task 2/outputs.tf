output "bucket_image_url" {
  value = local.image_url
}

output "load_balancer_ip" {
  value = yandex_lb_network_load_balancer.lamp_balancer.listener[0].external_address_spec[0].address
}

output "instance_group_id" {
  value = yandex_compute_instance_group.lamp_group.id
}