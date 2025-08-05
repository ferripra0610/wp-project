FROM php:8.3-fpm

WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    unzip \
    zip \
    git \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mysqli zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy project files
COPY . /var/www

# Install PHP dependencies
#RUN composer install --no-interaction

# Set permissions (optional)
RUN chown -R www-data:www-data /var/www

EXPOSE 9000
