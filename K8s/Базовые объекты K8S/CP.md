# Домашнее задание к занятию «Базовые объекты K8S»

### Цель задания

В тестовой среде для работы с Kubernetes, установленной в предыдущем ДЗ, необходимо развернуть Pod с приложением и подключиться к нему со своего локального компьютера. 

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключенным Git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. Описание [Pod](https://kubernetes.io/docs/concepts/workloads/pods/) и примеры манифестов.
2. Описание [Service](https://kubernetes.io/docs/concepts/services-networking/service/).

------

### Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod.
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

------

### Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web.
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создать Service с именем netology-svc и подключить к netology-web.
4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

------

### Правила приёма работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода команд `kubectl get pods`, а также скриншот результата подключения.
3. Репозиторий должен содержать файлы манифестов и ссылки на них в файле README.md.

------

### Критерии оценки
Зачёт — выполнены все задания, ответы даны в развернутой форме, приложены соответствующие скриншоты и файлы проекта, в выполненных заданиях нет противоречий и нарушения логики.

На доработку — задание выполнено частично или не выполнено, в логике выполнения заданий есть противоречия, существенные недостатки.




### Задание 1. Создать Pod с именем hello-world

[![kube_hello_world_yaml.png](https://s10.iimage.su/s/05/gjO9dpDx4qNWd0yG5zH7UsBzpYPde2UqJwhpstSpy.png)](https://iimg.su/i/jO9dpD)

[![Kube_Hello_world_Browser.png](https://s10.iimage.su/s/05/gAfFfp8xTUvT3N9HNpJRBFyXBXK8DhJiDPeyFTP7O.png)](https://iimg.su/i/AfFfp8)

[![Hello_world_curl.png](https://s10.iimage.su/s/05/gF1NIWfxpFFGUvhRCbYCCWCUNjCF9SErJw72H53K1.png)](https://iimg.su/i/F1NIWf)


### Задание 2. Создать Service и подключить его к Pod

[![Nerology_POd_Manifest.png](https://s10.iimage.su/s/05/gshG5R9x5uedA99MOOgkLrBJh3TcSkvq6gW3YomFL.png)](https://iimg.su/i/shG5R9)

[![Netology_curl.png](https://s10.iimage.su/s/05/gfm5jGyxVbDZdKAzucIEVH75Gzs8EI042SRiwveu6.png)](https://iimg.su/i/fm5jGy)

[![Pods.png](https://s10.iimage.su/s/05/gHBO08nxKZk2yWaeyUVZnb5MGRhpKloZF6mByG9yB.png)](https://iimg.su/i/HBO08n)

[![Service.png](https://s10.iimage.su/s/05/ggL8UC3xupRhSfoz6BmijbjQJpizkzilQY7JseTie.png)](https://iimg.su/i/gL8UC3)

[![Curl_Service.png](https://s10.iimage.su/s/05/g12GdwKxWADwA073yNiX0iIOUBHfC3IESdyW8ikji.png)](https://iimg.su/i/12GdwK)

[![Service_browser.png](https://s10.iimage.su/s/05/gKv76JVxdQz198Uohpp9Jz5BE61N5K0CNSoBYAaIS.png)](https://iimg.su/i/Kv76JV)
