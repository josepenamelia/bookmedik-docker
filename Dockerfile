FROM php:7.4-apache
RUN apt-get update && apt-get install -y mariadb-client
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
ADD bookmedik /var/www/html/
EXPOSE 80
ENV DB_USER user1
ENV DB_PASS pass
ENV DB_NAME usuarios
ENV DB_HOST mariadb
ADD Script.sh /usr/local/bin/Script.sh
ADD bookmedik/schema.sql /opt
RUN chmod +x /usr/local/bin/Script.sh
CMD ["/usr/local/bin/Script.sh"]
