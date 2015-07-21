FROM ubuntu:trusty

MAINTAINER Erick Almeida <ephillipe@gmail.com>

RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache \
 && echo 'APT {Install-Recommends="false";Install-Suggests="false";};' > /etc/apt/apt.conf.d/no-recommends \
 && rm /etc/cron.weekly/fstrim \
 && rm /etc/cron.daily/apt \
 && rm /etc/cron.daily/dpkg \
 && rm /etc/cron.daily/passwd \
 && apt-get install aptitude -y -q

COPY apt-install /usr/local/bin/
COPY sources.list /etc/apt/
ENV NUM_CPU="grep -c processor /proc/cpuinfo" DEBIAN_FRONTEND=noninteractive
