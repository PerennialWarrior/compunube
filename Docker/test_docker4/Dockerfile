FROM centos
MAINTAINER Juan Camilo Espinosa
RUN yum install httpd -y
VOLUME /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
