FROM httpd:2.4

USER root

RUN apt update

WORKDIR /opt

RUN apt install -y wget  > /dev/null 2>&1 \
    && wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.0.tar.gz > /dev/null 2>&1 \
    && mkdir -p /var/www \
    && chmod -R g+rwx /var/www \
    && cd /var/www \
    && tar -zxf /opt/mediawiki-1.37.0.tar.gz  > /dev/null 2>&1 \
    && ln -s mediawiki-1.37.0/ mediawiki \
    && sed -i -e "s|\/var\/www|\/var\/www\/mediawiki|g" /usr/local/apache2/conf/httpd.conf
#&& sed -e 's/DocumentRoot "/var/www"/DocumentRoot "/var/www/mediawiki"/g' 

RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf


EXPOSE 80