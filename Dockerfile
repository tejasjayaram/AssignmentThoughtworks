FROM httpd:2.4

RUN apt update

WORKDIR /opt

RUN apt install -y wget gnupg \
    && wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.0.tar.gz \
    && wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.0.tar.gz.sig \
    && gpg --verify mediawiki-1.37.0.tar.gz.sig mediawiki-1.37.0.tar.gz \
    && cd /var/www \
    && tar -zxf /opt/mediawiki-1.37.0.tar.gz \
    && chown -R apache:apache /var/www/mediawiki-1.37.0 \
    && ln -s mediawiki-1.37.0/ mediawiki \
    && sed -e 's/DocumentRoot "/var/www"/DocumentRoot "/var/www/mediawiki"/g' 

RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf


EXPOSE 80