FROM composer:2.5.4 AS build

COPY ./ /build
WORKDIR /build

RUN composer install

FROM php:8.1.0-fpm-buster

COPY --from=build /build /application
WORKDIR "/application"

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php8.0-mysql php-xdebug libmcrypt-dev \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

CMD ["php", "artisan", "serve"] 