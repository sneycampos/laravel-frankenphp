# Laravel 11 + FrankenPHP Development Environment

This project provides a development environment for Laravel using FrankenPHP. The environment is dockerized for easy setup and tear down.

## Features
- FrankenPHP 1.9
- PHP 8.2
- Laravel 11

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Services

The Docker Compose configuration includes the php service running using FrankenPHP

## Usage

Once the Docker container are up and running, you can access the Laravel application at [http://localhost](http://localhost).

## PHP Info
You can access the PHP information page at [http://localhost/phpinfo.php](http://localhost/phpinfo.php).

[//]: # (## Debugging)

[//]: # ()
[//]: # (Xdebug is configured in the FrankenPHP service. You can start a debugging session by setting a breakpoint in your code and making a request to the application.)

[//]: # (``)
