FROM php:7.2-fpm-alpine

RUN apk --update add --no-cache --virtual .phpize-deps \
       libxml2-dev \
       zlib-dev \
       $PHPIZE_DEPS \
       libpng-dev \
       imagemagick-dev \
       libtool \
  && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
  && pecl install imagick-3.4.4 \
  && docker-php-ext-install mbstring pdo pdo_mysql tokenizer xml zip gd exif sockets \
  && docker-php-ext-enable imagick \
  && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
  && apk del .phpize-deps

ARG PHP_INI_PATH=/usr/local/etc/php/php.ini
ARG PHP_FPM_POOL_PATH=/usr/local/etc/php-fpm.d/www.conf
# Fix composer installation for exceded memory limit
ENV MEMORY_LIMIT=100M

RUN \
    adduser -D -u 1000 php && \
    mv /usr/local/etc/php/php.ini-production $PHP_INI_PATH && \
    sed -i \
      -e "s/upload_max_filesize = .*/upload_max_filesize = \${UPLOAD_MAX_FILESIZE}/g" \
      -e "s/post_max_size = .*/post_max_size = \${POST_MAX_SIZE}/g" \
      -e "s/memory_limit = .*/memory_limit = \${MEMORY_LIMIT}/g" \
      -e "s/error_reporting = .*/error_reporting = E_ALL/g" \
      -e "s/display_errors = .*/display_errors = On/g" \
      -e "s/;date.timezone =/date.timezone = \${DATE_TIMEZONE}/g" \
      $PHP_INI_PATH && \
    sed -i \
      -e "s/;listen\.mode = .*/listen.mode = 0666/g" \
      -e "s/;request_terminate_timeout = .*/request_terminate_timeout = 60/g" \
      -e "s/pm\.max_children = .*/pm.max_children = 70/g" \
      -e "s/pm\.start_servers = .*/pm.start_servers = 20/g" \
      -e "s/pm\.min_spare_servers = .*/pm.min_spare_servers = 20/g" \
      -e "s/pm\.max_spare_servers = .*/pm.max_spare_servers = 35/g" \
      -e "s/pm\.max_requests = .*/pm.max_requests = 500/g" \
      # supress warnings
      -e "s/^user =/;user =/g" \
      -e "s/^group =/;group =/g" \
      $PHP_FPM_POOL_PATH

RUN apk add --no-cache git
RUN apk add --no-cache npm

RUN mkdir /app && \
  chown php:php /app

USER php
EXPOSE 9000
WORKDIR /app
