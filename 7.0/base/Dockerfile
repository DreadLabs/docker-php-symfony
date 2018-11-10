FROM dreadlabs/php-base:7.0-fpm

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y php7.0-xml php7.0-xsl php-curl php-redis \
    && rm -rf /var/lib/apt/lists/*

ADD rootfs /
