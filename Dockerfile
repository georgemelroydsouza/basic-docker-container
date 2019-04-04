FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install apache2 -y

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    less \
    vim \
    # Install git
    git \
    # Install apache
    apache2 \
    # Install php 7.2
    libapache2-mod-php7.2 \
    php7.2-cli \
    php7.2-json \
    php7.2-curl \
    php7.2-fpm \
    php7.2-gd \
    php7.2-ldap \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-soap \
    php7.2-sqlite3 \
    php7.2-xml \
    php7.2-zip \
    php7.2-intl \
    php-imagick \
    # Install tools
    openssl \
    nano \
    graphicsmagick \
    imagemagick \
    ghostscript \
    mysql-client \
    iputils-ping \
    sqlite3 \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# overwrite the apache vhost
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY Ports.conf /etc/apache2/ports.conf
CMD a2dissite 000-default
CMD a2ensite 000-default
CMD service apache2 restart

CMD ["apache2ctl", "-D", "FOREGROUND"]

# open the  container port
EXPOSE 8000
