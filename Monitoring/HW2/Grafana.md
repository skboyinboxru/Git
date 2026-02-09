# Домашнее задание к занятию 14 «Средство визуализации Grafana»

## Задание повышенной сложности

**При решении задания 1** не используйте директорию [help](./help) для сборки проекта. Самостоятельно разверните grafana, где в роли источника данных будет выступать prometheus, а сборщиком данных будет node-exporter:

- grafana;
- prometheus-server;
- prometheus node-exporter.

За дополнительными материалами можете обратиться в официальную документацию grafana и prometheus.

В решении к домашнему заданию также приведите все конфигурации, скрипты, манифесты, которые вы 
использовали в процессе решения задания.

**При решении задания 3** вы должны самостоятельно завести удобный для вас канал нотификации, например, Telegram или email, и отправить туда тестовые события.

В решении приведите скриншоты тестовых событий из каналов нотификаций.

## Обязательные задания

### Задание 1

1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.
1. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
1. Подключите поднятый вами prometheus, как источник данных.
1. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.

## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
1. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
1. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);
- CPULA 1/5/15;
- количество свободной оперативной памяти;
- количество места на файловой системе.

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

## Задание 3

1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
1. В качестве решения задания приведите скриншот вашей итоговой Dashboard.

## Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
1. В качестве решения задания приведите листинг этого файла.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.


### Ответ:


[![Promitheus_UP.png](https://s4.iimage.su/s/09/gx7HpfExp96v9vwsQTwLKSmWWqgCT8kHAEVzyhh5.png)](https://iimg.su/i/x7HpfE)


[![CPU_Usage.png](https://s4.iimage.su/s/09/g2dDjaGxc3tET9YmwtEftjIgkr6nUKqJMJ3eSIzi.png)](https://iimg.su/i/2dDjaG)


[![Load_Average1.png](https://s4.iimage.su/s/09/gmlPOUnxtzk3K2qGI9POgDAUOyPLzMOJVmsUb1o2.png)](https://iimg.su/i/mlPOUn)


[![Load_Average2.png](https://s4.iimage.su/s/09/gkzKdmxxaOKRFWzFRmOGqmjFBPA5qhieHtqH8oOV.png)](https://iimg.su/i/kzKdmx)


[![Free_Memory.png](https://s4.iimage.su/s/09/gqD1A47xWIOBQ0VW57cF3OVUGivCce6at5PYfh6w.png)](https://iimg.su/i/qD1A47)


[![Free_disk.png](https://s4.iimage.su/s/09/gMAvtpjxfepgOfpP1Ovc4uVkrjndYMLvRJ38oQbF.png)](https://iimg.su/i/MAvtpj)


[![Metrics.png](https://s4.iimage.su/s/09/gNH7Zw7x2W3URE5677macdu5YVlbuiiLKrfjTvru.png)](https://iimg.su/i/NH7Zw7)


[![Alerts_Ruls.png](https://s4.iimage.su/s/09/gepkWQHxC4zXOMQfaKfQZgb6kbFXfvOob2vwyPzY.png)](https://iimg.su/i/epkWQH)





    
    
