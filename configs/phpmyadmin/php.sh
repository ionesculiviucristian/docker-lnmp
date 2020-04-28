ARG PHP_INI_PATH=/usr/local/etc/php/php.ini

RUN \
    sed -i \
      -e "s/upload_max_filesize = .*/upload_max_filesize = \${UPLOAD_MAX_FILESIZE}/g" \
      -e "s/post_max_size = .*/post_max_size = \${POST_MAX_SIZE}/g" \
      -e "s/memory_limit = .*/memory_limit = \${MEMORY_LIMIT}/g" \
      -e "s/error_reporting = .*/error_reporting = E_ALL/g" \
      -e "s/display_errors = .*/display_errors = On/g" \
      -e "s/;date.timezone =/date.timezone = \${DATE_TIMEZONE}/g" \
      $PHP_INI_PATH