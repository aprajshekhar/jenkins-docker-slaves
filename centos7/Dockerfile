FROM centos:latest
MAINTAINER A.P. Rajshekhar

#Update the system
RUN yum -y update && yum clean all

#Setup ssh
RUN yum install -y openssh-server
RUN mkdir -p /var/run/sshd

#Install JDK 7 (latest edition)
RUN yum install -y  openjdk-7-jdk

# Install packages needed for the build
RUN yum install -y  git maven python

# Add user jenkins to the image
RUN adduser --quiet jenkins
# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22 

CMD ["/usr/sbin/sshd", "-D"]
