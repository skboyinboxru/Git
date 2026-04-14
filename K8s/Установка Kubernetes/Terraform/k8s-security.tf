resource "yandex_vpc_security_group" "k8s_sg" {
  name       = "k8s-security-group"
  network_id = yandex_vpc_network.develop.id
  folder_id  = var.folder_id

  # Kubernetes API
  ingress {
    protocol       = "TCP"
    description    = "Kubernetes API"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 6443
  }

  # etcd
  ingress {
    protocol       = "TCP"
    description    = "etcd"
    v4_cidr_blocks = [var.default_cidr[0]]
    from_port      = 2379
    to_port        = 2380
  }

  # kubelet
  ingress {
    protocol       = "TCP"
    description    = "kubelet"
    v4_cidr_blocks = [var.default_cidr[0]]
    port           = 10250
  }

  # NodePort services
  ingress {
    protocol       = "TCP"
    description    = "NodePort services"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 30000
    to_port        = 32767
  }

  # Calico BGP
  ingress {
    protocol       = "TCP"
    description    = "Calico BGP"
    v4_cidr_blocks = [var.default_cidr[0]]
    port           = 179
  }

  # SSH
  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  # HTTP/HTTPS
  ingress {
    protocol       = "TCP"
    description    = "HTTP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }

  ingress {
    protocol       = "TCP"
    description    = "HTTPS"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }

  # Исходящий трафик (разрешить всё)
  egress {
    protocol       = "TCP"
    description    = "Allow all outgoing TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

  egress {
    protocol       = "UDP"
    description    = "Allow all outgoing UDP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

  egress {
    protocol       = "ICMP"
    description    = "Allow ICMP"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}