# Use the official image as a parent image
FROM centos:7 as build

LABEL maintainer="Tomka Boris"

# Change pass for root user
RUN echo 'pass' | passwd --stdin root

# Update the system, install OpenSSH Server, and set up users
RUN yum install openssh-server -y

# Configure SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

# Opern port 22
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]

# Using multi-stage builds as it is best practice strategy for layer optimization.
FROM scratch
COPY --from=build / /