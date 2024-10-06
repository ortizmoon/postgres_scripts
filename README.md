## RU



# Скрипты для бэкапов и обслуживания баз данных (PostgreSQL)

Этот проект содержит в себе простые скрипты для создания резервных копий (`pgdump.bat`) и проведения обслуживания баз данных PostgreSQL (`maintenance.bat`). <br>Необходимо создать пользователя, который будет иметь права на подключение, бэкап и обслуживание баз данных, после чего задать их в файле `config.bat`, помимо путей .<br>

Скрипты предназначены для автоматизации процесса резервного копирования баз данных PostgreSQL с использованием pg_dump, и их сжатия с помощью 7-Zip. .<br>
Запускаются на **Windows**.
Для обслуживания баз данных используются стандартные инструменты PostgreSQL: VACUUM, ANALYZE и REINDEX.
## Что необходимо:
____
### **Склонировать репозиторий:**
```bash
git clone git@github.com:ortizmoon/postgres_scripts.git

```
____
### **Установить 7-zip**.<br>
Скачать и установить 7-zip с официального сайта, если это еще не было сделано.
____
### Переменные в `config.bat` <br>

   - **PGBIN**: Путь к папке bin (например, C:\Program Files\PostgreSQL\13.7\bin).
   - **DBS**: Имена баз данных для резервного копирования, через запятую (например, db1,db2,db3).
   - **BACKUPPATH**: Директория, в которой будут храниться файлы резервных копий.
   - **LOGPATH**: Директория, в которой будут сохраняться файлы журналов.
   - **PGUSER**: Пользователь для подключения к базам.
   - **PGPASSWORD**: Пароль для подключения к базам.
   - **PGHOST**:  Адрес сервера базы данных (например, 127.0.0.1)
----

### Логи

Скрипт создает журналы при каждом запуске скриптов.

Файлы журналов хранятся в той же директории, что и файлы дампов.<br> Каждый файл журнала именуется в соответствии с соответствующей базой данных и временной меткой, по формату: `<имя_базы_данных>_<временная_метка>.log`.



----

<br>
<br> 

## EN


# Database Scripts (PostgreSQL)

This project contains a simple scripts for are creating backups (`pgdump.bat`) and performing maintenance (`maintenance.bat`) on PostgreSQL databases. You need to create a user who will have permissions for connecting, backing up, and maintaining the databases, and then specify these credentials in the `config.bat` file, along with the paths.<br>

This script is intended for **Windows**.<br>
It's designed to automate the backup process of your **PostgreSQL** databases using `pg_dump` and compress them with **7-Zip**.<br>
Default PostgreSQL tools used for database maintenance: `VACUUM`, `ANALYZE`, and `REINDEX`
## Setup
____
### **Clone the repository:**
```bash
git clone git@github.com:ortizmoon/postgres_scripts.git

```
____
### **Install 7-zip**.<br>
Install program from official site
____
### **Variables in `config.bat`**<br>


   - **PGBIN**: Set the PostgreSQL `bin` folder path (e.g., C:\Program Files\PostgreSQL\13.7\bin).
   - **DBS**: Set the databases names for back up, separated by commas (e.g., db1,db2,db3).
   - **BACKUPPATH**: Set the directory where backup files will be stored.
   - **LOGPATH**: Set the directory where log files will be saved.
   - **PGUSER**: Set the database user.
   - **PGPASSWORD**: Set the database password. 
   - **PGHOST**: Set your database server address (e.g., `127.0.0.1`).

----

### Logging

The script creates logs for each database dump operation, which are essential for tracking the success or failure of the backup process. 

The log files are stored in the same directory as the dump files. Each log file is named according to the corresponding database and timestamp, following the format: `<database_name>_<timestamp>.log`.
