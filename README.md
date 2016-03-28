## Liferay Portal Tomcat (6.1.2-ce-ga3)

[Liferay](https://www.liferay.com/) [Tomcat bundle](https://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.1.2%20GA3/)

### Base Docker Image

* [centos7](http://dockerfile.github.io/#/centos)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Clone this repo

3. Build an image from Dockerfile: `docker build -t="liferay-portal-tomcat:6.1.2-ce-ga3" -f="liferay-portal-tomcat-6.1.2-ce-ga3/Dockerfile"`)


### Usage

    docker run -d -p 8080:8080

#### Attach persistent/shared directories

    docker run -d -p 8080:8080 -v <liferay-data-dir>:/opt/liferay-portal-tomcat-6.1.2-ce-ga3/data \
		-v <liferay-deploy-dir>:/opt/liferay-portal-tomcat-6.1.2-ce-ga3/deploy \
		-v <liferay-log-dir>:/opt/liferay-portal-tomcat-6.1.2-ce-ga3/logs \
		-v <tomcat-conf-dir>:/opt/liferay-portal-tomcat-6.1.2-ce-ga3/tomcat-7.0.40/conf:ro \
		-v <tomcat-log-dir>:/opt/liferay-portal-tomcat-6.1.2-ce-ga3/tomcat-7.0.40/logs \
		-v <tomcat-temp-dir>:/opt/liferay-portal-tomcat-6.1.2-ce-ga3/tomcat-7.0.40/temp \
		-v <tomcat-webapps-dir>:/opt/liferay-portal-tomcat-6.1.2-ce-ga3/tomcat-7.0.40/webapps \
		-v <tomcat-work-dir>:/opt/liferay-portal-tomcat-6.1.2-ce-ga3/tomcat-7.0.40/work \
		liferay-portal-tomcat:6.1.2-ce-ga3

Open `http://<host>:8080` to verify.

