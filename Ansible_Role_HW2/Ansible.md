Домашнее задание к занятию 5 «Тестирование roles»
Подготовка к выполнению
Установите molecule и его драйвера: pip3 install "molecule molecule_docker molecule_podman.
Выполните docker pull aragast/netology:latest — это образ с podman, tox и несколькими пайтонами (3.7 и 3.9) внутри.
Основная часть
Ваша цель — настроить тестирование ваших ролей.

Задача — сделать сценарии тестирования для vector.

Ожидаемый результат — все сценарии успешно проходят тестирование ролей.

Molecule
Запустите molecule test -s ubuntu_xenial (или с любым другим сценарием, не имеет значения) внутри корневой директории clickhouse-role, посмотрите на вывод команды. Данная команда может отработать с ошибками или не отработать вовсе, это нормально. Наша цель - посмотреть как другие в реальном мире используют молекулу И из чего может состоять сценарий тестирования.
Перейдите в каталог с ролью vector-role и создайте сценарий тестирования по умолчанию при помощи molecule init scenario --driver-name docker.
Добавьте несколько разных дистрибутивов (oraclelinux:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.
Добавьте несколько assert в verify.yml-файл для проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.).
Запустите тестирование роли повторно и проверьте, что оно прошло успешно.
Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.
Tox
Добавьте в директорию с vector-role файлы из директории.
Запустите docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash, где path_to_repo — путь до корня репозитория с vector-role на вашей файловой системе.
Внутри контейнера выполните команду tox, посмотрите на вывод.
Создайте облегчённый сценарий для molecule с драйвером molecule_podman. Проверьте его на исполнимость.
Пропишите правильную команду в tox.ini, чтобы запускался облегчённый сценарий.
Запустите команду tox. Убедитесь, что всё отработало успешно.
Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.
После выполнения у вас должно получится два сценария molecule и один tox.ini файл в репозитории. Не забудьте указать в ответе теги решений Tox и Molecule заданий. В качестве решения пришлите ссылку на ваш репозиторий и скриншоты этапов выполнения задания.





[![Molecula_clickhouse.png](https://s4.iimage.su/s/04/ghT4yCtxOAuyw9mSS8zmgThNYKmtYA7zAFnwTwtW.png)](https://iimg.su/i/hT4yCt)


[![Molecule_test_Vector_role.png](https://s4.iimage.su/s/04/g0tk9QRxd6ziyWfiff6sOH8TEXeN1zVKfJQjJS4z.png)](https://iimg.su/i/0tk9QR)


[![tox_failed.png](https://s4.iimage.su/s/04/gaPPB32xfvzwX51rc9bcD1jMvI87HGhK4892eXzX.png)](https://iimg.su/i/aPPB32)


[![tox_succeed.png](https://s4.iimage.su/s/04/gQua5mix8O6kKClYkqS8IYI0QLOuTDIk2azzksoH.png)](https://iimg.su/i/Qua5mi)


[ссылка на репозиторий с ролью](https://github.com/skboyinboxru/vector-role)



