# Домашнее задание к занятию «Установка Kubernetes»

### Цель задания

Установить кластер K8s.

### Чеклист готовности к домашнему заданию

1. Развёрнутые ВМ с ОС Ubuntu 20.04-lts.


### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция по установке kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/).
2. [Документация kubespray](https://kubespray.io/).

-----

### Задание 1. Установить кластер k8s с 1 master node

1. Подготовка работы кластера из 5 нод: 1 мастер и 4 рабочие ноды.
2. В качестве CRI — containerd.
3. Запуск etcd производить на мастере.
4. Способ установки выбрать самостоятельно.

## Дополнительные задания (со звёздочкой)

**Настоятельно рекомендуем выполнять все задания под звёздочкой.** Их выполнение поможет глубже разобраться в материале.
Задания под звёздочкой необязательные к выполнению и не повлияют на получение зачёта по этому домашнему заданию. 

------

### Правила приёма работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl get nodes`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.



### Задание 1. Установить кластер k8s с 1 master node

[![Screenshot_1.png](https://s10.iimage.su/s/14/gp1DxmAxifKivvLXsGp2dwk5uRa0j2E5Mi9ET1w4r.png)](https://iimg.su/i/p1DxmA)


[![Screenshot_2.png](https://s10.iimage.su/s/14/gUk7RryxEew8ygLAth1vqkXKBXVlcc1UPnKIi4wSE.png)](https://iimg.su/i/Uk7Rry)


- Созданы 5 ВМ (1 master + 4 workers) через Terraform в Yandex Cloud
- Установлен Kubernetes с помощью Kubespray
- CRI: containerd
- etcd запущен на master ноде

[Terraform](https://github.com/skboyinboxru/Git/tree/main/K8s/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20Kubernetes/Terraform)
[Kubespray](https://github.com/skboyinboxru/Git/tree/main/K8s/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20Kubernetes/inventory)
