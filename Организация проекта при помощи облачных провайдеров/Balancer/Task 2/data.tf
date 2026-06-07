data "yandex_vpc_network" "develop" {
  name = "develop"   # имя сети из задания 1
}

data "yandex_vpc_subnet" "public" {
  name       = "public"
  network_id = data.yandex_vpc_network.develop.id
}