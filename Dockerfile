FROM debian 

RUN apt-get -y update
RUN apt-get -y install build-essential 
RUN apt-get install -y git \
	&& apt-get install -y wget \
	&& apt-get install -y iputils-ping  unzip \
	&& apt-get install -y  php php-mysql php-curl \
	&& apt-get install -y  apache2 \
	&& apt-get install -y  make sed

ARG dir
WORKDIR /var/www/
RUN  git clone https://github.com/Mike317-Dev/php-sample-application 
RUN mv php-sample-application $dir
RUN chown -R www-data:www-data /var/www/$dir
RUN chmod -R 755 $dir
WORKDIR $dir
RUN make
ADD example.conf /etc/apache2/sites-available 
RUN sed -i "s/dir/$dir/g" /etc/apache2/sites-available/example.conf
WORKDIR /etc/apache2/sites-available 
RUN a2ensite example.conf
RUN  a2enmod rewrite
WORKDIR /var/www/$dir
ARG DB_HOST
RUN sed -i "s/localhost/$DB_HOST/g" config-dev/db-connection.php
RUN sed -i '$a ServerName localhost' /etc/apache2/apache2.conf 
RUN service apache2 restart
RUN echo '. /etc/apache2/envvars' > /root/apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/apache.sh && \ 
 chmod +x /root/apache.sh

CMD /root/apache.sh
