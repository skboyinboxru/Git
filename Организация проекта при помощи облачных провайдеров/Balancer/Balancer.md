# Домашнее задание к занятию «Вычислительные мощности. Балансировщики нагрузки»  

### Подготовка к выполнению задания

1. Домашнее задание состоит из обязательной части, которую нужно выполнить на провайдере Yandex Cloud, и дополнительной части в AWS (выполняется по желанию). 
2. Все домашние задания в блоке 15 связаны друг с другом и в конце представляют пример законченной инфраструктуры.  
3. Все задания нужно выполнить с помощью Terraform. Результатом выполненного домашнего задания будет код в репозитории. 
4. Перед началом работы настройте доступ к облачным ресурсам из Terraform, используя материалы прошлых лекций и домашних заданий.

---
## Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.
 
2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.
 
3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.
4. (дополнительно)* Создать Application Load Balancer с использованием Instance group и проверкой состояния.

Полезные документы:

- [Compute instance group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance_group).
- [Network Load Balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer).
- [Группа ВМ с сетевым балансировщиком](https://cloud.yandex.ru/docs/compute/operations/instance-groups/create-with-balancer).

---



[![Screenshot_1.png](https://s10.iimage.su/s/07/gGwIzJrxNKCB7HtOzosM4Ay8pc87XVdzOndPzDEJP.png)](https://iimg.su/i/GwIzJr)

[![Screenshot_2.png](https://s10.iimage.su/s/07/gngoPlXxSmZmJ1iQ9HFs3E5u2hHaHF03YOLDdkzdu.png)](https://iimg.su/i/ngoPlX)

[![Screenshot_3.png](https://s10.iimage.su/s/07/gG9zPlWxHCzmReYtUKHDFWlCyOjmwoJFiSNKGObql.png)](https://iimg.su/i/G9zPlW)

[![Screenshot_4.png](https://s10.iimage.su/s/07/gqKGaGdxF3kPVRH3B0nQ2OI0stQtgbui9n9alwbEn.png)](https://iimg.su/i/qKGaGd)

[bucket](https://github.com/skboyinboxru/Git/blob/main/%D0%9E%D1%80%D0%B3%D0%B0%D0%BD%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0%20%D0%BF%D1%80%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D0%B8%20%D0%BE%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B0%D0%B9%D0%B4%D0%B5%D1%80%D0%BE%D0%B2/Balancer/Task%202/bucket.tf)

[data](https://github.com/skboyinboxru/Git/blob/main/%D0%9E%D1%80%D0%B3%D0%B0%D0%BD%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0%20%D0%BF%D1%80%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D0%B8%20%D0%BE%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B0%D0%B9%D0%B4%D0%B5%D1%80%D0%BE%D0%B2/Balancer/Task%202/data.tf)

[instance_group](https://github.com/skboyinboxru/Git/blob/main/%D0%9E%D1%80%D0%B3%D0%B0%D0%BD%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0%20%D0%BF%D1%80%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D0%B8%20%D0%BE%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B0%D0%B9%D0%B4%D0%B5%D1%80%D0%BE%D0%B2/Balancer/Task%202/instance_group.tf)

[lamp_user_data](https://github.com/skboyinboxru/Git/blob/main/%D0%9E%D1%80%D0%B3%D0%B0%D0%BD%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0%20%D0%BF%D1%80%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D0%B8%20%D0%BE%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B0%D0%B9%D0%B4%D0%B5%D1%80%D0%BE%D0%B2/Balancer/Task%202/lamp_user_data.tftpl)

[load_balancer](https://github.com/skboyinboxru/Git/blob/main/%D0%9E%D1%80%D0%B3%D0%B0%D0%BD%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0%20%D0%BF%D1%80%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D0%B8%20%D0%BE%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B0%D0%B9%D0%B4%D0%B5%D1%80%D0%BE%D0%B2/Balancer/Task%202/load_balancer.tf)

[locals](https://github.com/skboyinboxru/Git/blob/main/%D0%9E%D1%80%D0%B3%D0%B0%D0%BD%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0%20%D0%BF%D1%80%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D0%B8%20%D0%BE%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B0%D0%B9%D0%B4%D0%B5%D1%80%D0%BE%D0%B2/Balancer/Task%202/locals.tf)

[outputs](https://github.com/skboyinboxru/Git/blob/main/%D0%9E%D1%80%D0%B3%D0%B0%D0%BD%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0%20%D0%BF%D1%80%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D0%B8%20%D0%BE%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B0%D0%B9%D0%B4%D0%B5%D1%80%D0%BE%D0%B2/Balancer/Task%202/outputs.tf)

[providers](https://github.com/skboyinboxru/Git/blob/main/%D0%9E%D1%80%D0%B3%D0%B0%D0%BD%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0%20%D0%BF%D1%80%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D0%B8%20%D0%BE%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B0%D0%B9%D0%B4%D0%B5%D1%80%D0%BE%D0%B2/Balancer/Task%202/providers.tf)

[variables](https://github.com/skboyinboxru/Git/blob/main/%D0%9E%D1%80%D0%B3%D0%B0%D0%BD%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0%20%D0%BF%D1%80%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D0%B8%20%D0%BE%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B0%D0%B9%D0%B4%D0%B5%D1%80%D0%BE%D0%B2/Balancer/Task%202/variables.tf)

