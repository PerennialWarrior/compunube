FROM centos
MAINTAINER Juan Camilo Espinosa
RUN yum install vsftpd -y
COPY vusers.txt /etc/vsftpd/
RUN db_load -T -t hash -f /etc/vsftpd/vusers.txt /etc/vsftpd/vsftpd-virtual-user.db; rm -v /etc/vsftpd/vusers.txt; \ 
	chmod 600 /etc/vsftpd/vsftpd-virtual-user.db
COPY vsftpd.conf /etc/vsftpd/
COPY vsftpd.virtual /etc/pam.d/
RUN mkdir -p /home/vftp/juan; chown -R ftp:ftp /home/vftp
EXPOSE 20 21
CMD ["/usr/sbin/vsftpd","-obackground=NO"]
