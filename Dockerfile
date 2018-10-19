FROM centos:7
MAINTAINER Keturah Dola-Borg (keturah@mania.systems)

RUN yum install -y epel-release && yum install -y python python2-pip python-setuptools java-1.8.0-openjdk nginx git make cronie

RUN mkdir /app && git clone git://git.zx2c4.com/PhotoFloat /app && rm /app/web/js/999-googletracker.js && mkdir /app/web/albums && mkdir /app/web/cache

RUN cd /app/web && make

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

COPY crontab /etc/cron.d/00-photofloat
RUN chmod 0644 /etc/cron.d/00-photofloat && crontab /etc/cron.d/00-photofloat

VOLUME /app/web

EXPOSE 80

CMD /usr/sbin/crond -n