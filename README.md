# MTS_SREcourse

---
## Module 2 homework: deploy Weather-api & PostgreSQL db

- Состоит из:
  1. `postgresql_cluster` - Ansible-playbook для разворачивания PG + HAproxy LB + etcd cluster
  2. `sre-course` - helm чарт для разворачивания приложения weather-api
--- 
### Изменения ansible
1. Изменен `Inventory` файл с указанием актуальных серверов
2. Добавлен `task` `prepare_ubuntu.yml` для подготовки ubuntu server (из apt ставится старая версия ansible)
3. в `var/main.yaml` - подключен HAproxy LB, деактивирован pg_bouncer, в pg_hba добавлено правило для доступа подсети 10.0.10.0/24

### Изменения Helm чарта
1. Прописаны параметры для подключения к БД
2. Используется 1 реплика для более удобного дебага 
3. Перед запуском необходимо произвести миграцию
   1. Через сервер с БД `psql -U postgres -a -f migration.sql`
   2. Через удобное ПО 

---
### Результат

```shell
(main)⚡ % curl -H "Host: sre-course-102" 91.185.85.213/cities/                                                        ~/Code/MTS_SREcourse
[{"id":1,"name":"test"}]%
(main)⚡ %                                                                                                             ~/Code/MTS_SREcourse
```