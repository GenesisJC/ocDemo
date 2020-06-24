FROM centos:7
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service
RUN chown apache:0 /etc/httpd/conf/httpd.conf && \
  chmod g+r /etc/httpd/conf/httpd.conf && \
  chown apache:0 /var/log/httpd && \
  chmod g+rwX /var/log/httpd && \
  chown apache:0 /var/run/httpd && \
  chmod g+rwX /var/run/httpd
RUN mkdir -p /var/www/html && echo "hello world!" >> /var/www/html/index.html && \
  chown -R apache:0 /var/www/html && \
  chmod -R g+rwX /var/www/html
USER apache
EXPOSE 80
CMD /usr/sbin/httpd -D FOREGROUND