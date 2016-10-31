#
# https://github.com/FreshmenDevOps/liferay-portal-tomcat
#

FROM centos:7

# default would be ASCII
RUN localedef -c -f UTF-8 -i en_US en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY tomcat-foreground.pl /
# Install nginx
RUN yum-config-manager --add-repo \
	http://download.opensuse.org/repositories/home:/FreshmenDevOps/CentOS_7/home:FreshmenDevOps.repo && \
	yum update --quiet --assumeyes && \
	yum install --quiet --assumeyes \
		perl \
		java-1.8.0-openjdk-headless \
		javapackages-tools \
		tomcat-native \
		liferay-portal-tomcat-7.0.2-ce-ga3 && \
	perl tomcat-foreground.pl && \
	rm /tomcat-foreground.pl && \
	yum remove --quiet --assumeyes perl && \
	rm -rf /var/cache/yum

# grab gosu for easy step-down from root
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 8.0.32
ENV GOSU_VERSION 1.10

ENV LIFERAY_VERSION 7.0.2-ce-ga3

VOLUME ["/etc/liferay-portal-tomcat-7.0.2-ce-ga3",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/data",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/deploy",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/logs",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/osgi",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/tools",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/work",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/tomcat-8.0.32/conf",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/tomcat-8.0.32/logs",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/tomcat-8.0.32/temp",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/tomcat-8.0.32/webapps",\
	"/opt/liferay-portal-tomcat-7.0.2-ce-ga3/tomcat-8.0.32/work"]

# align UID and GID to gain VOLUME rw access, then gosu tomcat
#USER tomcat
WORKDIR /opt/liferay-portal-tomcat-7.0.2-ce-ga3

CMD ["/usr/sbin/dliferay-portal-tomcat-7.0.2-ce-ga3", "start"]

EXPOSE 8080
