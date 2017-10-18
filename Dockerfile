FROM dreadlabs/php-base:7.0

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y php7.0-xml php7.0-xsl \
    && rm -rf /var/lib/apt/lists/* \
    && curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony \
    && chmod a+x /usr/local/bin/symfony
