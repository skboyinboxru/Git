resource "yandex_vpc_security_group" "ssh_allowed" {
  name        = "ssh-allowed"
  description = "Allow SSH from anywhere"
  network_id  = yandex_vpc_network.develop.id

  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  egress {
    protocol       = "ANY"
    description    = "Allow all outbound"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}