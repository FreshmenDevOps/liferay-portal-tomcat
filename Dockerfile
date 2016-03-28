#
# https://github.com/FreshmenDevOps/liferay-portal-tomcat-6.1.2-ce-ga3
#

FROM centos:7

COPY tomcat-foreground.pl /
# Install nginx
RUN yum-config-manager --add-repo \
	http://download.opensuse.org/repositories/home:/FreshmenDevOps/CentOS_7/home:FreshmenDevOps.repo && \
	yum update --quiet --assumeyes && \
	yum install --quiet --assumeyes \
		perl \
		java-1.8.0-openjdk-headless \
		javapackages-tools \
		liferay-portal-tomcat-6.1.2-ce-ga3 && \
	perl tomcat-foreground.pl && \
	rm /tomcat-foreground.pl && \
	yum remove --quiet --assumeyes perl && \
	rm -rf /var/cache/yum

ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION 7.0.40

ENV LIFERAY_VERSION 6.1.2-ce-ga3

VOLUME ["/opt/liferay-portal-tomcat-6.1.2-ce-ga3/data",\
	"/opt/liferay-portal-tomcat-6.1.2-ce-ga3/deploy",\
	"/opt/liferay-portal-tomcat-6.1.2-ce-ga3/logs",\
	"/opt/liferay-portal-tomcat-6.1.2-ce-ga3/tomcat-7.0.40/conf",\
	"/opt/liferay-portal-tomcat-6.1.2-ce-ga3/tomcat-7.0.40/logs",\
	"/opt/liferay-portal-tomcat-6.1.2-ce-ga3/tomcat-7.0.40/temp",\
	"/opt/liferay-portal-tomcat-6.1.2-ce-ga3/tomcat-7.0.40/webapps",\
	"/opt/liferay-portal-tomcat-6.1.2-ce-ga3/tomcat-7.0.40/work"]

USER tomcat
WORKDIR /opt/liferay-portal-tomcat-6.1.2-ce-ga3

CMD ["/usr/sbin/dliferay-portal-tomcat-6.1.2-ce-ga3", "start"]

EXPOSE 8080
