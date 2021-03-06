FROM debian:jessie
MAINTAINER Levon Karayan

ENV JENKINS_HOME="/var/jenkins_home"
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

RUN groupadd -g ${gid} ${group} \
		&& useradd -d "${JENKINS_HOME}" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

RUN mkdir -p /var/log/jenkins && chown -R ${user}:${group} /var/log/jenkins

VOLUME ["/var/log/jenkins", "${JENKINS_HOME}"]

USER ${user}

CMD ["echo", "Jenkins Master Data Container"]
