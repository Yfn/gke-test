FROM php:7.3-fpm-alpine3.10

ARG WD=/var/www/app
WORKDIR $WD

RUN apk update && apk add --no-cache \
    mc \
    php-json \
    php-mbstring \
    php-curl \
    composer \
    && composer require pecee/simple-router --working-dir=$WD

COPY  *.php $WD/
COPY  *.conf /etc/nginx/conf.d/

CMD ["php-fpm"]
