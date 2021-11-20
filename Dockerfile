FROM httpd:2.4

USER root

RUN apt update

WORKDIR /opt

RUN apt install -y wget  > /dev/null \
    && wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.0.tar.gz > /dev/null \
    && mkdir -p /var/www \
    && chmod -R g+rwx /var/www \
    && cd /var/www \
    && tar -zx /opt/mediawiki-1.37.0.tar.gz > /dev/null \
    && chown -R apache:apache /var/www/mediawiki-1.37.0 \
    && ln -s mediawiki-1.37.0/ mediawiki \
    && sed -e 's/DocumentRoot "/var/www"/DocumentRoot "/var/www/mediawiki"/g' 

RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf


EXPOSE 80