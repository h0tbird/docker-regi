#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM centos:7
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7
RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
RUN yum update -y && yum clean all
RUN yum install -y epel-release && yum clean all
RUN yum install -y dhclient docker-registry && yum clean all
ADD rootfs /

#------------------------------------------------------------------------------
# Entrypoint:
#------------------------------------------------------------------------------

ENTRYPOINT ["/init", "/usr/bin/python", "/usr/bin/gunicorn", "--access-logfile", "-", "--error-logfile", "-", "--debug", "--max-requests", "100", "--graceful-timeout", "3600", "-t", "3600", "-k", "gevent", "-b", "0.0.0.0:5000", "-w", "8", "docker_registry.wsgi:application"]
