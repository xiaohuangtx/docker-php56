FROM php:5.6.40-fpm

COPY ./sources.list /etc/apt/sources.list
COPY ./redis-4.3.0 /usr/src/php/ext/redis
COPY ./freetype-2.8.1 /home/freetype-2.8.1
COPY ./php.ini /usr/local/etc/php/php.ini

RUN apt-get update && apt install -y --allow-unauthenticated \
    libmcrypt-dev \
    libxml2-dev \
    zip \
    libwebp-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    && docker-php-ext-install -j$(nproc) redis pdo_mysql iconv mcrypt mbstring zip mysql bcmath gettext mysqli pcntl soap sockets xmlrpc shmop sysvsem \
    && cd /home/freetype-2.8.1/ && chmod -R 777 ./ && ./configure --prefix=/usr/local/freetype && make && make install \
    && docker-php-ext-configure gd --with-webp-dir=/usr/include/webp --with-jpeg-dir=/usr/include --with-png-dir=/usr/include --with-freetype-dir=/usr/local/freetype \
    && docker-php-ext-install gd \
    && docker-php-ext-enable gd \
    && rm -rf /home/freetype-2.8.1
    

