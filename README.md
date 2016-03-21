# docker-ubuntu15.10
My Ubuntu boilerplate image that forms the base for my docker containers. This container is built from ubuntu:15.10, (68 MB Before Flatification) at the time of this writing.

# What is in this image
```
Dockerfile to build a ubuntu:14.04 baseimage with a couple of extra packages.

Sending build context to Docker daemon 3.072 kB
Step 1 : FROM ubuntu:15.10
 ---> 3b9cbe897315
Step 2 : MAINTAINER Simon K. Takite - simon.takite@gmail.com
 ---> Using cache
 ---> 877534e6d1ba
Step 3 : RUN echo 'Dpkg::Progress-Fancy "1";' | tee -a /etc/apt/apt.conf.d/99progressbar
 ---> Using cache
 ---> da6a2e4bfd1d
Step 4 : RUN set -xe                 && DEBIAN_FRONTEND=noninteractive         && apt-get -y install nano 	sudo 	vim
 ---> Using cache
 ---> e57824792f88
Step 5 : RUN apt-get -y purge         ubuntu-minimal         eject         isc-dhcp-common         isc-dhcp-client         kbd         console-setup         xkb-data         bzip2         apt-utils         python3.4         python3-minimal         python3.4-minimal         libpython3-stdlib:amd64         libpython3.4-minimal:amd64         libpython3.4-stdlib:amd64         keyboard-configuration &&                 DEBIAN_FRONTEND=noninteractive apt-get -y autoremove
 ---> Using cache
 ---> b330400a2d3d
Step 6 : RUN for x in `ls /usr/share/locale | grep -v en_GB`; do rm -fr /usr/share/locale/$x; done;
 ---> Using cache
 ---> c27919ea32cf
Step 7 : RUN for x in `ls /usr/share/i18n/locales/ | grep -v en_`; do rm -fr /usr/share/i18n/locales/$x; done
 ---> Using cache
 ---> 6b976ca0510b
Step 8 : RUN rm -fr /usr/share/doc/* /usr/share/man/* /usr/share/groff/* /usr/share/info/*
 ---> Using cache
 ---> af44464b9c19
Step 9 : RUN rm -rf /usr/share/lintian/* /usr/share/linda/* /var/cache/man/*
 ---> Using cache
 ---> 9bb92b1693bb
Step 10 : RUN cp /etc/localtime /root/old.timezone &&         rm -f /etc/localtime &&         ln -s /usr/share/zoneinfo/Europe/Oslo /etc/localtime
 ---> Running in a4ff29fe3c2d
 ---> d4c5f62e4f20
Removing intermediate container a4ff29fe3c2d
Step 11 : CMD /bin/bash
 ---> Running in ea593f054024
 ---> 6847111270db
Removing intermediate container ea593f054024
Successfully built 6847111270db
```
