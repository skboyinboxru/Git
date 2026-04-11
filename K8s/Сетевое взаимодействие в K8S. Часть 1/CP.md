# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1»

### Цель задания

В тестовой среде Kubernetes необходимо обеспечить доступ к приложению, установленному в предыдущем ДЗ и состоящему из двух контейнеров, по разным портам в разные контейнеры как внутри кластера, так и снаружи.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым Git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) Deployment и примеры манифестов.
2. [Описание](https://kubernetes.io/docs/concepts/services-networking/service/) Описание Service.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.
2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.
3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.
4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

------

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.

------

### Правила приёма работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl` и скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.


### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

[![Screenshot_1.png](https://s10.iimage.su/s/11/ghhwd65xEDbqYDz6OZkEISsejIGUYDKtbBfDWezQk.png)](https://iimg.su/i/hhwd65)

[![Service_Nginx_multytool.png](https://s10.iimage.su/s/11/gA6vhYZxkz6XiM96nJ4tjAtmHT32rH2yZSRqrj8Ob.png)](https://iimg.su/i/A6vhYZ)

[![Test+curl.png](https://s10.iimage.su/s/11/grenZ8dxdIrdIv3l4av23rmrCqGHtDblbgOsTRr8p.png)](https://iimg.su/i/renZ8d)

[Deployment](https://github.com/skboyinboxru/Git/blob/main/K8s/%D0%A1%D0%B5%D1%82%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B2%D0%B7%D0%B0%D0%B8%D0%BC%D0%BE%D0%B4%D0%B5%D0%B9%D1%81%D1%82%D0%B2%D0%B8%D0%B5%20%D0%B2%20K8S.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%201/Manifests/deployment.yaml)

[ServiceClusterip](https://github.com/skboyinboxru/Git/blob/main/K8s/%D0%A1%D0%B5%D1%82%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B2%D0%B7%D0%B0%D0%B8%D0%BC%D0%BE%D0%B4%D0%B5%D0%B9%D1%81%D1%82%D0%B2%D0%B8%D0%B5%20%D0%B2%20K8S.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%201/Manifests/service-clusterip.yaml)


### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

[![NodePort.png](https://s10.iimage.su/s/11/glz2nCOx2Pq10kyZHjigIbzRCG9AVzpvqQfHJ9bkU.png)](https://iimg.su/i/lz2nCO)

[![Screenshot_2.png](https://s10.iimage.su/s/11/gljvCVWx4kR7tC0MgMwW46y8LhWgHA1UXZOLOG84e.png)](https://iimg.su/i/ljvCVW)

[Nodeport](https://github.com/skboyinboxru/Git/blob/main/K8s/%D0%A1%D0%B5%D1%82%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B2%D0%B7%D0%B0%D0%B8%D0%BC%D0%BE%D0%B4%D0%B5%D0%B9%D1%81%D1%82%D0%B2%D0%B8%D0%B5%20%D0%B2%20K8S.%20%D0%A7%D0%B0%D1%81%D1%82%D1%8C%201/Manifests/service-nodeport.yaml)
