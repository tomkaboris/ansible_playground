# Use the official image as a parent image
FROM centos:7 as build

LABEL maintainer="Tomka Boris"

# Change pass for root user
RUN echo 'root:pass' | chpasswd

# Update the system, install OpenSSH Server, and set up users
RUN yum -y install openssh-server && ssh-keygen -A && systemctl enable sshd

# Run SSH after image is build
CMD ["/usr/sbin/sshd", "-D"]

# Using multi-stage builds is the current best practice strategy for layer optimization.
FROM scratch
COPY --from=build / /