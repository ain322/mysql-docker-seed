FROM mysql:8.0.12

ENV MYSQL_USER=demo
ENV MYSQL_PASSWORD=demoPassword
ENV MYSQL_ROOT_PASSWORD=rootPassword
ENV MYSQL_DATABASE=migration

RUN mkdir /data

COPY migration.cnf /etc/mysql/conf.d
COPY seed.sh /data
COPY seed.sql /data

RUN /data/seed.sh
