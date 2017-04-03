## Liferay Portal Tomcat (6.2.5-ce-ga6)

[Liferay](https://www.liferay.com/) [Tomcat bundle](https://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.5%20GA6/) using [openSUSE build](https://build.opensuse.org/package/show/home:FreshmenDevOps/liferay-portal-tomcat-6.2.5-ce-ga6)

### Base Docker Image

* [centos7](http://dockerfile.github.io/#/centos)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Clone this repo

3. Build an image from Dockerfile: `docker build -t="liferay-portal-tomcat:6.2.5-ce-ga6" -f="liferay-portal-tomcat/Dockerfile"`)


### Usage

    docker run -d -p 8080:8080

#### Attach persistent/shared directories

Assuming the tomcat user and group exist on the host and have rw/ro permissions to the volumes:

    docker run -d -p 8080:8080 \
		-e LOCAL_USER_ID=$(id -u tomcat) \
		-e LOCAL_GROUP_ID=$(id -g tomcat) \
		-v <liferay-etc-dir>:/etc/liferay-portal-tomcat-6.2.5-ce-ga6 \
		-v <liferay-data-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/data \
		-v <liferay-deploy-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/deploy \
		-v <liferay-log-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/logs \
		-v <liferay-osgi-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/osgi \
		-v <liferay-tools-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/tools \
		-v <liferay-work-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/work \
		-v <tomcat-conf-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/tomcat-7.0.62/conf:ro \
		-v <tomcat-log-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/tomcat-7.0.62/logs \
		-v <tomcat-temp-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/tomcat-7.0.62/temp \
		-v <tomcat-webapps-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/tomcat-7.0.62/webapps \
		-v <tomcat-work-dir>:/opt/liferay-portal-tomcat-6.2.5-ce-ga6/tomcat-7.0.62/work \
		liferay-portal-tomcat:6.2.5-ce-ga6

Open `http://<host>:8080` to verify.

