FROM php:7.1.8-apache

RUN apt-get update \
	&& apt-get install -y \
		wget \
    zlib1g-dev \
		curl \
		git \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
# Run docker-php-ext-install for available extensions
RUN docker-php-ext-install pdo pdo_mysql opcache zip

ENTRYPOINT ["docker-php-entrypoint"]
WORKDIR /var/www/html
EXPOSE 80
CMD ["apache2-foreground"]
