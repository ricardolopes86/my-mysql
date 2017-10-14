FROM mysql

ENV MYSQL_ROOT_PASSWORD="admin"

ADD createdb-script.sql /docker-entrypoint-initdb.d/createdb.sql

EXPOSE 3306