output "public_vm_external_ip" {
  value = yandex_compute_instance.public_vm.network_interface.0.nat_ip_address
  description = "External IP of public VM (for SSH)"
}

output "private_vm_internal_ip" {
  value = yandex_compute_instance.private_vm.network_interface.0.ip_address
  description = "Internal IP of private VM (accessible via public VM)"
}

output "nat_instance_external_ip" {
  value = yandex_compute_instance.nat.network_interface.0.nat_ip_address
  description = "External IP of NAT instance (for debugging)"
}

output "nat_instance_internal_ip" {
  value = yandex_compute_instance.nat.network_interface.0.ip_address
  description = "Internal IP of NAT instance (192.168.10.254)"
}