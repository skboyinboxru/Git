# Домашнее задание к занятию «Управляющие конструкции в коде Terraform»

### Цели задания

1. Отработать основные принципы и методы работы с управляющими конструкциями Terraform.
2. Освоить работу с шаблонизатором Terraform (Interpolation Syntax).

------

### Чек-лист готовности к домашнему заданию

1. Зарегистрирован аккаунт в Yandex Cloud. Использован промокод на грант.
2. Установлен инструмент Yandex CLI.
3. Доступен исходный код для выполнения задания в директории [**03/src**](https://github.com/netology-code/ter-homeworks/tree/main/03/src).
4. Любые ВМ, использованные при выполнении задания, должны быть прерываемыми, для экономии средств.

------

### Внимание!! Обязательно предоставляем на проверку получившийся код в виде ссылки на ваш github-репозиторий!
Убедитесь что ваша версия **Terraform** ~>1.12.0
Теперь пишем красивый код, хардкод значения не допустимы!
------

### Задание 1

1. Изучите проект.
2. Инициализируйте проект, выполните код. 


Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud .

------

### Задание 2

1. Создайте файл count-vm.tf. Опишите в нём создание двух **одинаковых** ВМ  web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент **count loop**. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )
2. Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" **разных** по cpu/ram/disk_volume , используя мета-аргумент **for_each loop**. Используйте для обеих ВМ одну общую переменную типа:
```
variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
}
```  
При желании внесите в переменную все возможные параметры.
4. ВМ из пункта 2.1 должны создаваться после создания ВМ из пункта 2.2.
5. Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.
6. Инициализируйте проект, выполните код.

------

### Задание 3

1. Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле **disk_vm.tf** .
2. Создайте в том же файле **одиночную**(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage"  . Используйте блок **dynamic secondary_disk{..}** и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

------

### Задание 4

1. В файле ansible.tf создайте inventory-файл для ansible.
Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции.
Готовый код возьмите из демонстрации к лекции [**demonstration2**](https://github.com/netology-code/ter-homeworks/tree/main/03/demo).
Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
2. Инвентарь должен содержать 3 группы и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
3. Добавьте в инвентарь переменную  [**fqdn**](https://cloud.yandex.ru/docs/compute/concepts/network#hostname).
``` 
[webservers]
web-1 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
web-2 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

[databases]
main ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
replica ansible_host<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

[storage]
storage ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
```
Пример fqdn: ```web1.ru-central1.internal```(в случае указания переменной hostname(не путать с переменной name)); ```fhm8k1oojmm5lie8i22a.auto.internal```(в случае отсутвия перменной hostname - автоматическая генерация имени,  зона изменяется на auto). нужную вам переменную найдите в документации провайдера или terraform console.
4. Выполните код. Приложите скриншот получившегося файла. 

Для общего зачёта создайте в вашем GitHub-репозитории новую ветку terraform-03. Закоммитьте в эту ветку свой финальный код проекта, пришлите ссылку на коммит.
**Удалите все созданные ресурсы**.



### Решение 1

[![LK_Network.png](https://s4.iimage.su/s/28/gvD9MjAx0It1UlBLP3oIZ4ft4UwwSXb2npWOshKR.png)](https://iimg.su/i/vD9MjA)



### Решение 2


1. Создайте файл count-vm.tf. Опишите в нём создание двух **одинаковых** ВМ  web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент **count loop**. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )
```
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


Variables

variable "vm_web_cores" {
  type = number
  default = 2
}

variable "vm_web_memory" {
  type = number
  default = 1
}

variable "vm_web_fraction" {
  type = number
  default = 20
}
```

2. Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" **разных** по cpu/ram/disk_volume , используя мета-аргумент **for_each loop**. Используйте для обеих ВМ одну общую переменную типа:
```
variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    core_fraction = number
    disk_volume = number
    platform_id = string
  }))
 
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 1
      core_fraction = 20
      disk_volume = 10
      platform_id = "standard-v3"
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 1
      core_fraction = 20
      disk_volume = 30
      platform_id = "standard-v3"
    }
  ]
}

resource "yandex_compute_instance" "db_vm" {
  for_each = { for i in var.each_vm : i.vm_name => i}
  name = each.value.vm_name
  hostname    = each.value.vm_name # fqdn

  platform_id = each.value.platform_id
  allow_stopping_for_update = true
  resources {
    cores = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_volume
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
      yandex_vpc_security_group.example.id
    ]
  }
```

4. ВМ из пункта 2.1 должны создаваться после создания ВМ из пункта 2.2.

В `count-vm.tf` добавил
```txt
depends_on = [yandex_compute_instance.db_vm]
```

5. Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.

`for_each-vm.tf`
```txt
  metadata = {
    ssh-keys = "ubuntu:${local.public_ssh_key}"
  }
```
`locals.tf`
```txt
locals {
  public_ssh_key = try(file("~/.ssh/id_ed25519.pub"))
}
```

[![4VMs.png](https://s4.iimage.su/s/28/gd8ITERxTnHLqv9L4jJf6Sf1AsmwhnXqGsRqgOo4.png)](https://iimg.su/i/d8ITER)

### Решение 3

1. Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле **disk_vm.tf** .
```txt
resource "yandex_compute_disk" "data_disks" {
    count = 3
    size = 1
    type = "network-hdd"
    name = "data-disk-${count.index + 1}"
}
```

[![disks_storage.png](https://s4.iimage.su/s/28/gOHbAw3xHQkQzyDQjlMKMe4PRzKfKmyuTOtJ4uTw.png)](https://iimg.su/i/OHbAw3)

2. 2. Создайте в том же файле **одиночную**(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage"  . Используйте блок **dynamic secondary_disk{..}** и мета-аргумент for_each для подключения созданных вами дополнительных дисков.
```txt
resource "yandex_compute_instance" "storage" {
    name = "storage"
    platform_id = "standard-v3"

    resources {
      cores = 2
      memory = 1
      core_fraction = 20
    }

    boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.data_disks
    content {
      disk_id = secondary_disk.value.id
    } 
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true
  }
}
```
[![storage_vm.png](https://s4.iimage.su/s/28/gPnw7oOxPL09ssnLyerpQUwrSiWVEjziV8WoyDWC.png)](https://iimg.su/i/Pnw7oO)


### Решение 4


[![ansible.png](https://s4.iimage.su/s/28/g1bX5eSxjOE7gCK6L1Oba4vb0EIKzRHzUDtoA6d5.png)](https://iimg.su/i/1bX5eS)



