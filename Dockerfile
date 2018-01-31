#base image

FROM nginx

MAINTAINER Alexey Kuznetsov <kuznetsovalexey34@gmail.com>

ENV USER ftpuser

ENV PASS changeme

RUN apt-get update && \
    apt-get install -y vsftpd supervisor && \
    mkdir -p /var/run/vsftpd/empty

RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

ADD vsftpd.conf /etc/vsftpd.conf

RUN mkdir /ftp

VOLUME ["/ftp"]

EXPOSE 20 21

EXPOSE 12020 12021 12022 12023 12024 12025

ENTRYPOINT ["/usr/local/bin/start.sh"]

CMD ["/usr/bin/supervisord"]
