# Домашнее задание к занятию «Helm»

### Цель задания

В тестовой среде Kubernetes необходимо установить и обновить приложения с помощью Helm.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение, например, MicroK8S.
2. Установленный локальный kubectl.
3. Установленный локальный Helm.
4. Редактор YAML-файлов с подключенным репозиторием GitHub.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция](https://helm.sh/docs/intro/install/) по установке Helm. [Helm completion](https://helm.sh/docs/helm/helm_completion/).

------

### Задание 1. Подготовить Helm-чарт для приложения

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения. 
2. Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.
3. В переменных чарта измените образ приложения для изменения версии.

------
### Задание 2. Запустить две версии в разных неймспейсах

1. Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.
2. Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.
3. Продемонстрируйте результат.

### Правила приёма работы

1. Домашняя работа оформляется в своём Git репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl`, `helm`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.

------

### Задание 1. Подготовить Helm-чарт для приложения

[web-app-chart](https://github.com/skboyinboxru/Git/tree/main/K8s/Helm/web-app-chart)

[![Screenshot_1.png](https://s10.iimage.su/s/12/g7joGdGxHuPp7atWQYjHkgLEKT2ZJRFieRhsm9YFe.png)](https://iimg.su/i/7joGdG)


------

### Задание 2. Запустить две версии в разных неймспейсах

[![Screenshot_2.png](https://s10.iimage.su/s/12/gmagBz3xSLT219BwrC7QtJewsVR3ALy5ofMWTWNkJ.png)](https://iimg.su/i/magBz3)


[![Screenshot_3.png](https://s10.iimage.su/s/12/gI2U6AMxw3KeQ020iaJinG5jFfEz3nYO6kZbyvYpQ.png)](https://iimg.su/i/I2U6AM)

[![Screenshot_4.png](https://s10.iimage.su/s/12/gyJLInVxGgMN3aytOwi7hazQE9GZMBPd3DzZzTZQB.png)](https://iimg.su/i/yJLInV)

[![Screenshot_5.png](https://s10.iimage.su/s/12/gZgeEAhxz6RWUNjoUjykYPt4Dc642gBOjhdXNB61G.png)](https://iimg.su/i/ZgeEAh)

