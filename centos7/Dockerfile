FROM centos:7
MAINTAINER A.P. Rajshekhar

#Update the system
RUN yum -y update && yum clean all

#Setup ssh
RUN yum install -y openssh-server
RUN mkdir -p /var/run/sshd

#Install JDK 7
RUN yum install -y  java-1.7.0-openjdk

# Install packages needed for the build
RUN yum install -y  git maven python

# Add user jenkins to the image
# RUN adduser  root
# Set password for the jenkins user (you may want to alter this).
RUN echo "root:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22 

CMD ["/usr/sbin/sshd", "-D"]
