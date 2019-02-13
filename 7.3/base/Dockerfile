FROM dreadlabs/php-base:7.3-fpm

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y php7.3-xml php-curl php-redis \
    && rm -rf /var/lib/apt/lists/*

ADD rootfs /
