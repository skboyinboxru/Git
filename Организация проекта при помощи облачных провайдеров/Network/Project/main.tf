resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# Публичная подсеть (без route table)
resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.public_cidr
}

# Таблица маршрутизации для приватной подсети
resource "yandex_vpc_route_table" "private_route" {
  name       = "private-route-table"
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"   # IP NAT-инстанса
  }
}

# Приватная подсеть с привязкой route table
resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.private_cidr
  route_table_id = yandex_vpc_route_table.private_route.id
}