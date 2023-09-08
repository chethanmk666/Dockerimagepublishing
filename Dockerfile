FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
#install packages
RUN apt-get install -y \
    apt-utils \
    curl \
    git \
    apt-transport-https \
    software-properties-common \
    g++ \
    build-essential

#install nginx
RUN apt install nginx -y

RUN apt-get install -qy language-pack-en-base \
    && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

#install php and its modules
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
    php-pear \
    php8.1 \
    php8.1-common \
    php8.1-mbstring \
    php8.1-dev \
    php8.1-xml \
    php8.1-cli \
	php8.1-mysql \
	php8.1-sqlite3 \
    php8.1-mbstring \
    php8.1-curl \
    php8.1-gd \
    php8.1-imagick \
    php8.1-xdebug \
    php8.1-xml \
    php8.1-zip \
    php8.1-odbc \
    php8.1-opcache \
    php8.1-redis \
    autoconf \
    zlib1g-dev \
    libapache2-mod-php8.1

EXPOSE 80:80

CMD ["nginx", "-g", "daemon off;"]
