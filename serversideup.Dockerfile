FROM serversideup/php:8.3-fpm-nginx-alpine as base

FROM base as development

USER root

ARG USER_ID=33
ARG GROUP_ID=33

RUN docker-php-serversideup-set-id www-data $USER_ID:$GROUP_ID && \
    docker-php-serversideup-set-file-permissions --owner $USER_ID:$GROUP_ID --service nginx

USER www-data

FROM base as production

COPY --chown=www-data:www-data . /var/www/html
