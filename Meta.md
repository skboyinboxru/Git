# Домашнее задание к занятию «Уязвимости и атаки на информационные системы»

### Инструкция по выполнению домашнего задания

1. Сделайте fork [репозитория c шаблоном решения](https://github.com/netology-code/sys-pattern-homework) к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/gitlab-hw или https://github.com/имя-вашего-репозитория/8-03-hw).
2. Выполните клонирование этого репозитория к себе на ПК с помощью команды `git clone`.
3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
   - впишите вверху название занятия и ваши фамилию и имя;
   - в каждом задании добавьте решение в требуемом виде: текст/код/скриншоты/ссылка;
   - для корректного добавления скриншотов воспользуйтесь инструкцией [«Как вставить скриншот в шаблон с решением»](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md);
   - при оформлении используйте возможности языка разметки md. Коротко об этом можно посмотреть в [инструкции по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md).
4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`).
5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
6. Любые вопросы задавайте в чате учебной группы и/или в разделе «Вопросы по заданию» в личном кабинете.

Желаем успехов в выполнении домашнего задания.

------

### Задание 1

Скачайте и установите виртуальную машину Metasploitable: https://sourceforge.net/projects/metasploitable/.

Это типовая ОС для экспериментов в области информационной безопасности, с которой следует начать при анализе уязвимостей.

Просканируйте эту виртуальную машину, используя **nmap**.

Попробуйте найти уязвимости, которым подвержена эта виртуальная машина.

Сами уязвимости можно поискать на сайте https://www.exploit-db.com/.

Для этого нужно в поиске ввести название сетевой службы, обнаруженной на атакуемой машине, и выбрать подходящие по версии уязвимости.

Ответьте на следующие вопросы:

- Какие сетевые службы в ней разрешены?
- Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)
  
*Приведите ответ в свободной форме.*

### Задание 2

Проведите сканирование Metasploitable в режимах SYN, FIN, Xmas, UDP.

Запишите сеансы сканирования в Wireshark.

Ответьте на следующие вопросы:

- Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?
- Как отвечает сервер?

*Приведите ответ в свободной форме.*


### Решение 1


[![Screenshot_30.png](https://s.iimg.su/s/21/BmhGn3bxZUv71K5eaNwaW2XIYzbXsgYQHxLHV6Xk.png)](https://iimg.su/i/5uJPAx)
[![Screenshot_31.png](https://s.iimg.su/s/21/ogu2yfDw0zWA5VHw2BNTq3e178VwhUtWfQ7lOR5g.png)](https://iimg.su/i/lOGVBZ)

- Какие сетевые службы в ней разрешены?

```
ftp
ssh
telnet
smtp
domain
http
rpcbind
net-bios-ssn
exec
login
tcpwrapped
bindshell
nfs
mysql
postgresql
vnc
X11
irc
ajp13
```

- Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)


  [![Screenshot_33.png](https://s.iimg.su/s/21/3roHbiZMQ7hAzhI0eq1rMRwAh9V101wOA865BV14.png)](https://iimg.su/i/gsfCZt)
  
  [![Screenshot_34.png](https://s.iimg.su/s/21/DNrTKe4r5kSybsY2VexLEySinqLQBdmdPjqRvAPN.png)](https://iimg.su/i/npLy8r)
  
  [![Screenshot_35.png](https://s.iimg.su/s/21/Y9hmlyWAHwSDuAU8CMyVhqviNTjgPhWTGvt0etkB.png)](https://iimg.su/i/8yRbg4)
  
  
### Решение 2

***SIN - сканирование***

SIN - сканирование с установкой полуоткрытого соединения, так как соединение не устанавливается до конца. На определенный порт посылается сообщение SYN, затем идет ожидание ответа, на основании которого определяется статус порта. Ответ SYN-ACK говорят о том, что порт прослушивается (состояние «открыт»), а ответ RST говорит о том, что не прослушивается. Если после нескольких запросов не приходит никакого ответа или в ответ приходит сообщение ICMP с ошибкой достижимости (Destination Unreachable), то статус порта определяется в состоянии «фильтруется».

***FIN сканирование***

FIN - сканирование основано на отправке запросов, содержащих только один установленный флаг контроля соединения - FIN. В отличие от запросов SYN, многие брандмауэры не блокируют такой PDU (Protocol Data Unit). Закрытый порт, как правило, отвечает на них ответом RST (разрыв соединения). Открытый порт - не отвечает.


***Xmas сканирование***

Xmas — сканирование основано на отправке запросов, содержащих разные флаги из всех доступных для контроля соединения. Сканирование Xmas возвращает три возможных состояния порта:
- Open-filtered - не возможно определить, открыт порт или отфильтрован. Даже если порт открыт, сканирование Xmas сообщит о нем как open-filtered. Это происходит, когда не получен ответ (даже после повторной передачи).
- Closed - если в ответ приходит сообщение RST.
- Filtered - брандмауэр фильтрует сканируемые порты; это происходит, когда ответом является ошибка ICMP unreachable (тип 3, код 1, 2, 3, 9, 10 или 13).

***UDP сканирование***

Сканирование медленное из-за специфики UDP и возможности потери пакетов запросы повторяются несколько раз (обычно три и более). С закрытого порта придет ICMP-сообщение об ошибке (Destination Unreachable). Если ответ не получен, статус порта определяется в состоянии «открыт» или «фильтруется», поскольку непонятно, что стало причиной - блокировка трафика средством защиты или потеря пакетов. В нашем случае, например, для сканирования порта назначения 1013 было отправлено 10 пакетов с разных портов источников. С точки зрения нагрузки на сеть данный тип сканирования самый ресурсоёмкий.
