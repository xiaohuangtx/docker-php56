FROM php:8.4-fpm-bookworm

COPY ./sources.list /etc/apt/sources.list
COPY ./php.ini /usr/local/etc/php/php.ini

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    libmcrypt-dev \
    libxml2-dev \
    libzip-dev \
    libwebp-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libonig-dev \
    libicu-dev \
    && docker-php-ext-install -j$(nproc) pdo_mysql iconv mbstring zip bcmath gettext mysqli pcntl soap sockets shmop sysvsem intl ftp \
    && docker-php-ext-configure gd --with-webp --with-jpeg --with-freetype \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install redis && docker-php-ext-enable redis \
    && pecl install mcrypt && docker-php-ext-enable mcrypt \
    && pecl install xmlrpc-beta && docker-php-ext-enable xmlrpc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

