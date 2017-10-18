# docker-php-symfony

## Description

A debian based PHP 7.0 docker image, with additional packages for running Symfony applications.

Additionally, it contains the Symfony installer.

## Makefile

Tested with GNU Make 3.81. `VERSION` environment variable defaults to `latest`.

### Build

    make build [-e VERSION=x.y]

### Release

    make release [-e VERSION=x.y]

## License

[MIT](LICENSE)
