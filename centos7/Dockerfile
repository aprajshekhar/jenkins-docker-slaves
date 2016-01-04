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
ADD docker-wrap.sh /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
VOLUME /var/lib/docker


# Make sure that the "root" user from evarga's image is part of the "docker"
# group. Needed to access the docker daemon's unix socket.
RUN usermod -a -G docker root


# place the jenkins slave startup script into the container
ADD jenkins-slave-startup.sh /
CMD ["/jenkins-slave-startup.sh"]
