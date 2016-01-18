# This dockerfile is based on tehranian/dind-jenkins-slave. The tehranian/dind-jenkins-slave uses Ubuntu as
# base system. This attempt is to migrate it to centos base image


FROM centos:latest
MAINTAINER A.P. Rajshekhar

# Update the system
RUN yum -y update && yum clean all

# Setup ssh
RUN yum install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Install JDK 7
RUN yum install -y  java-1.7.0-openjdk

# Install packages needed for the build
RUN yum install -y  git maven python

# Install docker
RUN yum -y install docker docker-registry lxc



# Add user jenkins to the image
# RUN adduser  root
# Set password for the jenkins user (you may want to alter this).
RUN echo "root:jenkins" | chpasswd

# Standard SSH port
# EXPOSE 22 

# CMD ["/usr/sbin/sshd", "-D"]


ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.8.3
ENV DOCKER_SHA256 f024bc65c45a3778cf07213d26016075e8172de8f6e4b5702bedde06c241650f

RUN curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-$DOCKER_VERSION" -o /usr/local/bin/docker \
	&& echo "${DOCKER_SHA256}  /usr/local/bin/docker" | sha256sum -c - \
	&& chmod +x /usr/local/bin/docker

COPY docker-entrypoint.sh /usr/local/bin/

CMD ["/root/jenkins-slave-startup.sh"]
