# Домашнее задание к занятию «Введение в Terraform»

### Цель задания
1. Установить и настроить Terrafrom.
2. Научиться использовать готовый код.

------

### Чеклист готовности к домашнему заданию

1. Скачайте и установите Terraform версии >=1.12.0 . Приложите скриншот вывода команды terraform --version.
2. Скачайте на свой ПК этот git-репозиторий. Исходный код для выполнения задания расположен в директории 01/src.
Убедитесь, что в вашей ОС установлен docker.


------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. Репозиторий с ссылкой на зеркало для установки и настройки Terraform: [ссылка](https://github.com/netology-code/devops-materials)
2. Установка docker: [ссылка](https://docs.docker.com/engine/install/ubuntu/).

------


### Задание 1
1. Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
2. Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)
3. Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps.
6. Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды docker ps.
7. Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.
8. Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ, а затем ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ строчкой из документации [terraform провайдера docker](https://library.tf/providers/kreuzwerker/docker/latest). (ищите в классификаторе resource docker_image )


------

### Решение
1. [![terraform_version.png](https://s4.iimage.su/s/22/g1Sxt7WxHvfft7gKWu7Oh1G1ug9oOQteapKLEXa1.png)](https://iimg.su/i/1Sxt7W)

2. В файле personal.auto.tfvars допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд).

3. [![terrraform_result.png](https://s4.iimage.su/s/22/gNS5POHxkOT9YgEKGkI0Dw2lfkTTtMKVMdUA0PNC.png)](https://iimg.su/i/NS5POH)

4. [![terraform_errors_1.png](https://s4.iimage.su/s/22/gW6egEHxCaLnLF840b7JXtu6lYt8AWQmQhhJaQNA.png)](https://iimg.su/i/W6egEH)

   [![terraform_errors_2.png](https://s4.iimage.su/s/22/gbGNn5txIaE2YP1SgsF9BmyQ47mwiwJN2linbJQA.png)](https://iimg.su/i/bGNn5t)

Не было указано имя, были заменены буквы на цифры, не правильно указаны ссылки на ресурсы

5. [![terraform_plan.png](https://s4.iimage.su/s/22/gLZAWe8x8EAbapWz2KFDOzuQ5a5EHO9b1DeAz8sS.png)](https://iimg.su/i/LZAWe8)

   [![terraform_plan2.png](https://s4.iimage.su/s/22/gVuFPUux5ReWBlnp3hAl2QMLnfEMfKHqRDPpE000.png)](https://iimg.su/i/VuFPUu)
   
6. [![terraform_hello_world.png](https://s4.iimage.su/s/22/gygj8Ojx9Y46zjCu4JevIB2srWtAr2NruXNkCjzz.png)](https://iimg.su/i/ygj8Oj)

мы можем ошибиться и без проверки удалить какой-то объект, если даже просто в его имени будет допущена опечатка, и т.п.

Полезен если нужна автоматизация, например в CI/CD и где все уже давно проверено, и нужно автоматически запустить развертывание структуры.

7. [![terraform_destroy.png](https://s4.iimage.su/s/22/gA05YwExlBeh3zouhIHuWcchMt7g3hXJTonGrm18.png)](https://iimg.su/i/A05YwE)

   [![terraform_tf_state.png](https://s4.iimage.su/s/22/ghLhVJ2x6MW5hRTokhZQaOOHfQaoeYCs1J5YcuiI.png)](https://iimg.su/i/hLhVJ2)

8. [![terraform_keep_locally.png](https://s4.iimage.su/s/22/gVGtr1nx0vKsvSDz8uvsgADyco0JG0vvGPlYcXjc.png)](https://iimg.su/i/VGtr1n)

