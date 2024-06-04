FROM dunglas/frankenphp:1-php8.2

ENV SERVER_NAME=:8080

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN \
    groupadd -g ${GROUP_ID} application && \
    useradd -u ${USER_ID} -g application -M application && \
    setcap -r /usr/local/bin/frankenphp && \
    chown -R application:application /data/caddy && chown -R application:application /config/caddy

RUN install-php-extensions \
	pdo_mysql \
	gd \
	intl \
    pcntl \
	zip \
    redis \
    xdebug

# Configure xdebug
RUN echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

ARG ENVIRONMENT=development
RUN mv "$PHP_INI_DIR/php.ini-$ENVIRONMENT" "$PHP_INI_DIR/php.ini"

USER application

EXPOSE 8080
