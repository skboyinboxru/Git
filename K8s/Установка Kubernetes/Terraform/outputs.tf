output "k8s_master_ip" {
  value = yandex_compute_instance.k8s_master.network_interface[0].nat_ip_address
}

output "k8s_worker_ips" {
  value = yandex_compute_instance.k8s_workers[*].network_interface[0].nat_ip_address
}

output "k8s_all_ips" {
  value = concat(
    [yandex_compute_instance.k8s_master.network_interface[0].nat_ip_address],
    yandex_compute_instance.k8s_workers[*].network_interface[0].nat_ip_address
  )
}