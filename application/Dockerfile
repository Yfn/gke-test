FROM php:7.3-fpm-alpine3.10

ARG WD=/app

RUN apk update && apk add --no-cache \
    mc \
    php-json \
    php-mbstring \
    php-curl \
    composer \
    && composer require pecee/simple-router

WORKDIR /var/www/testapp

COPY  .php $WD/

CMD ["php-fpm"]
