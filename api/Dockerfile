FROM php:8.1.0-fpm-buster

# Install selected extensions and other stuff
RUN apt-get update && apt-get upgrade -y && apt-get install -y libzip-dev && apt-get install -y libpq-dev

RUN docker-php-ext-install pdo pdo_pgsql

RUN docker-php-ext-install zip exif pcntl

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer self-update

WORKDIR "/application"
COPY composer.json composer.json
COPY composer.lock composer.lock
COPY package.json package.json
COPY artisan artisan
COPY ./bootstrap/app.php ./bootstrap/app.php
COPY ./app/Console/Kernel.php ./app/Console/Kernel.php
COPY ./app/Exceptions/Handler.php ./app/Exceptions/Handler.php

RUN composer install

COPY . .

CMD ["php", "artisan", "serve"] 