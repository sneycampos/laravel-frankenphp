# Laravel + FrankenPHP Development Environment

This project provides a development environment for Laravel using FrankenPHP. The environment is dockerized for easy setup and tear down.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Services

The Docker Compose configuration includes the following services:

- `php`: The main PHP service, using the FrankenPHP image. This service runs the PHP application.
- `mariadb`: The MariaDB service, used as the database for the application.
- `redis`: The Redis service, used for caching and session storage.
- `horizon`: The Laravel Horizon service, used for managing Laravel queues.

## Usage

Once the Docker containers are up and running, you can access the Laravel application at [http://localhost:80](http://localhost:80).

## Debugging

Xdebug is configured in the FrankenPHP service. You can start a debugging session by setting a breakpoint in your code and making a request to the application.
