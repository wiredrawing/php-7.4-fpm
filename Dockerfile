# phpのバージョンを7.4.27に固定する
FROM php:7.4.27-fpm


RUN apt-get update && apt-get install -y \
libpq-dev \
libjpeg-dev \
libpng-dev \
libjpeg62-turbo-dev \
libfreetype6-dev \
zlib1g-dev \
vim \
nodejs \
libzip-dev \
unzip \
ca-certificates \
git


RUN docker-php-ext-configure gd  --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd opcache pdo pdo_pgsql pdo_mysql zip pgsql

RUN git config --global http.sslVerify false
# Composerのインストール
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# zend opcacheを有効にしたphp.iniファイルをコピーする
#COPY ./php.ini /usr/local/etc/php/php.ini

# php-fpmの設定をコピーする
#COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf


WORKDIR /var/www/html/
#RUN cd /var/www/html/en && composer install

# ENTRYPOINT ["docker-php-entrypoint"]
# CMD ["-DFOREGROUND"]

# ENTRYPOINT ["/usr/local/bin/docker-php-entrypoint", "-DFOREGROUND"]
#WORKDIR /var/www/html
#CMD ["/usr/local/bin/docker-php-entrypoint", "-DFOREGROUND"]
