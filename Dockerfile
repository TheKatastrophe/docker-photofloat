FROM centos:7
MAINTAINER Keturah Dola-Borg (keturah@mania.systems)

RUN yum install -y epel-release && yum install -y python python2-pip python-setuptools java-1.8.0-openjdk nginx git make cronie

RUN mkdir /app

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY bootstrap.sh /bootstrap.sh

COPY crontab /etc/cron.d/00-photofloat
RUN chmod 0644 /etc/cron.d/00-photofloat && crontab /etc/cron.d/00-photofloat

VOLUME /app

EXPOSE 80

CMD /usr/sbin/crond -n