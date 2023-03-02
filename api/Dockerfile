FROM php:8.1.0-fpm-buster

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php8.0-mysql php-xdebug libmcrypt-dev \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer self-update

WORKDIR "/application"
COPY . .

RUN composer install

CMD ["php", "artisan", "serve"] 