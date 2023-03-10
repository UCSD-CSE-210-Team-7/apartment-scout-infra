FROM postgres

COPY ./bootstrap.sql /docker-entrypoint-initdb.d/bootstrap.sql

COPY ./users.csv /var/lib/postgresql/data/users.csv
COPY ./user_region.csv /var/lib/postgresql/data/user_region.csv
COPY ./tours.csv /var/lib/postgresql/data/tours.csv
COPY ./conversations.csv /var/lib/postgresql/data/conversations.csv
COPY ./messages.csv /var/lib/postgresql/data/messages.csv
