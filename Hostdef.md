# Домашнее задание к занятию  «Защита хоста»

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

1. Установите **eCryptfs**.
2. Добавьте пользователя cryptouser.
3. Зашифруйте домашний каталог пользователя с помощью eCryptfs.


*В качестве ответа  пришлите снимки экрана домашнего каталога пользователя с исходными и зашифрованными данными.*  

### Задание 2

1. Установите поддержку **LUKS**.
2. Создайте небольшой раздел, например, 100 Мб.
3. Зашифруйте созданный раздел с помощью LUKS.

*В качестве ответа пришлите снимки экрана с поэтапным выполнением задания.*


### Решение 1


1. Установите **eCryptfs**.
    ```
    apt update
    apt upgrade
    sudo apt install ecryptfs-utils
    ```
2. Добавьте пользователя cryptouser.
   ```
   adduser cryptouser
   ```
3. Зашифруйте домашний каталог пользователя с помощью eCryptfs.
   ```
   sudo usermod -aG sudo cryptouser
   sudo ecryptfs-migrate-home -u cryptouser
   ``` 
*В качестве ответа  пришлите снимки экрана домашнего каталога пользователя с исходными и зашифрованными данными.* 

  ***До шифрования***
  
  [![Screenshot_61.png](https://s.iimg.su/s/29/SQrysRhZyBWhOuVR6egdjLTWqToCCVhpZJFoScRV.png)](https://iimg.su/i/UpGCxz)
  
  
   ***После шифрования***
   
  [![Screenshot_62.png](https://s.iimg.su/s/29/bQPdzWUHRtSLQ8cZFOenvFQauRBVkqUxtyvGf9z4.png)](https://iimg.su/i/bvpm0a)
  
  [![Screenshot_63.png](https://s.iimg.su/s/29/dX4NX0HJl8U7c3c8ofSoMY3AO4sYywpKC1gsLqKQ.png)](https://iimg.su/i/8InLQv)
  
  
### Решение 2

1. Установите поддержку **LUKS**.

[![Screenshot_64.png](https://s.iimg.su/s/29/KDGvg7oKfVRy3bXpoGmNhyClXEtalcpxOMNQbUK1.png)](https://iimg.su/i/WQdjAd)

2. Создайте небольшой раздел, например, 100 Мб.

[![Screenshot_65.png](https://s.iimg.su/s/29/Td2Hjp0spg5w37UNgZiLIzaKzF6BV9nIGQrrAhBQ.png)](https://iimg.su/i/eCF8ee)

3. Зашифруйте созданный раздел с помощью LUKS.

[![Screenshot_66.png](https://s.iimg.su/s/29/iJVOwmIoIyfyBkFlJnPbCDx458KT96jhl7vYmFPt.png)](https://iimg.su/i/9wdJO3)

[![Screenshot_67.png](https://s.iimg.su/s/29/7j5nuar7TpUzrFNOtYbCLyZZs4inqkrcFg4ggcP7.png)](https://iimg.su/i/o3Kk0c)
