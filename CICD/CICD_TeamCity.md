# Домашнее задание к занятию 11 «Teamcity»

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.
2. Дождитесь запуска teamcity, выполните первоначальную настройку.
3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.
4. Авторизуйте агент.
5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).
6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).

## Основная часть

1. Создайте новый проект в teamcity на основе fork.
2. Сделайте autodetect конфигурации.
3. Сохраните необходимые шаги, запустите первую сборку master.
4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.
5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.
6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.
7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.
8. Мигрируйте `build configuration` в репозиторий.
9. Создайте отдельную ветку `feature/add_reply` в репозитории.
10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.
11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.
12. Сделайте push всех изменений в новую ветку репозитория.
13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.
14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.
15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.
16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.
17. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.
18. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.
19. В ответе пришлите ссылку на репозиторий.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---

### Решение

[![Снимок экрана 2026-01-19 021556.png](https://s5.iimage.su/s/19/gFNOQgtxrME3NM800YiyGdhKKHoKDsmWja81qWac.png)](https://iimg.su/i/FNOQgt)

[![Screenshot_28.png](https://s5.iimage.su/s/19/g5hPG9xxuBt3wV2InwHa03G1aX4qV7AsRJu3DeJ8.png)](https://iimg.su/i/5hPG9x)

[![nexus_screen.png](https://s5.iimage.su/s/19/gcwasHuxspLcKyJa6B9Hzf8vq6qdj6P1o7D3UE5w.png)](https://iimg.su/i/cwasHu)

[![Commit_Repo_main.png](https://s5.iimage.su/s/19/gczQ8M1xXuRddadKi0uNEchg33CegSgGIPeUelhJ.png)](https://iimg.su/i/czQ8M1)

[![Снимок экрана 2026-01-19 235731.png](https://s5.iimage.su/s/19/gPlpAEyxznvXHnJWb0f9qTw0kVYEz677eGo73bpQ.png)](https://iimg.su/i/PlpAEy)

[![tests_branches.png](https://s5.iimage.su/s/19/gnx3nsixV2jUdtCLPzqg7I4DbdaMgrMJKne2wwhW.png)](https://iimg.su/i/nx3nsi)

[![Artifacts.png](https://s5.iimage.su/s/19/geWTKk6x9Q17mVALSdpesmVBI6sys4RIdX1Ora65.png)](https://iimg.su/i/eWTKk6)

[ссылка](https://github.com/skboyinboxru/example-teamcity.git)

