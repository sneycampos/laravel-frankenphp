FROM dunglas/frankenphp:1.9-php8.2-bookworm

ENV SERVER_NAME=:80

# Install git and htop
RUN apt-get update && apt-get install -y \
    git \
    htop \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user to run the application to avoid permission issues
# when mounting volumes from the host system.
# Default UID and GID are set to 1000, but can be overridden at build time.
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN \
    groupadd -g ${GROUP_ID} application && \
    useradd -u ${USER_ID} -g application -M application && \
    setcap -r /usr/local/bin/frankenphp && \
    chown -R application:application /data/caddy && \
    chown -R application:application /config/caddy && \
    chown -R application:application /app

# Install and enable PHP extensions using the install-php-extensions script
RUN install-php-extensions \
	pdo_mysql \
	gd \
	intl \
	zip \
    redis \
    @composer \
    pcntl

# Use the development php.ini configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

WORKDIR /app

EXPOSE 80
