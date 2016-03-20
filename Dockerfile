FROM ubuntu:15.10
MAINTAINER Simon K. Takite - simon.takite@gmail.com

# Turn on Apt Progress Output
RUN echo 'Dpkg::Progress-Fancy "1";' | tee -a /etc/apt/apt.conf.d/99progressbar

# Remove un-necessary packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y purge \
	ubuntu-minimal \
	eject \
	isc-dhcp-common \
	isc-dhcp-client \
	kbd \
	console-setup \
	xkb-data \
	vim-common \
	vim-tiny \
	bzip2 \
	apt-utils \
	python3.4 \
	python3-minimal \
	python3.4-minimal \
	libpython3-stdlib:amd64 \
	libpython3.4-minimal:amd64 \
	libpython3.4-stdlib:amd64 \
	keyboard-configuration && \
	DEBIAN_FRONTEND=noninteractive apt-get -y autoremove

# Install required packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nano \
	sudo \
	openssh-server \
	&& apt-get clean \
	&& echo -n > /var/lib/apt/extended_states

# Strip out extra locale data
RUN for x in `ls /usr/share/locale | grep -v en_GB`; do rm -fr /usr/share/locale/$x; done;
RUN for x in `ls /usr/share/i18n/locales/ | grep -v en_`; do rm -fr /usr/share/i18n/locales/$x; done

# Remove Man Pages and Docs to preserve Space
RUN rm -fr /usr/share/doc/* /usr/share/man/* /usr/share/groff/* /usr/share/info/* \
	&& rm -rf /usr/share/lintian/* /usr/share/linda/* /var/cache/man/*

# Strip out extra locale data
RUN cp /etc/localtime /root/old.timezone && \
	rm -f /etc/localtime && \
	ln -s /usr/share/zoneinfo/Europe/Oslo /etc/localtime
# Set documentation generation to off for future installed packages
ADD 01_nodoc /etc/dpkg/dpkg.cfg.d/

# Set documentation generation to off for future installed packages
RUN echo "net.ipv6.conf.all.disable_ipv6=1" > /etc/sysctl.d/disableipv6.conf && \
	echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf && \
	echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf && \
	echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf && \
	echo "net.ipv6.conf.eth0.disable_ipv6 = 1" >> /etc/sysctl.conf && \
	echo "net.ipv6.conf.eth1.disable_ipv6 = 1" >> /etc/sysctl.conf

EXPOSE 22
