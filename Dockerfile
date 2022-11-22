FROM php:8.0-fpm
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install \
	libzip-dev zip unzip \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
	libpq-dev
RUN docker-php-ext-install pgsql pdo pdo_pgsql
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
