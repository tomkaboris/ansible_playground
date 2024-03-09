# Use the official image as a parent image
FROM ubuntu:bionic as build

LABEL maintainer="Tomka Boris"

# Change pass for root user
RUN echo 'root:pass' | chpasswd

# Update the system, install OpenSSH Server, and set up users
RUN apt-get update --fix-missing || true && \ 
    apt install -y --no-install-recommends python-minimal python-pip netcat jq sshpass openssh-server python-setuptools && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf  /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Run SSH after image is build
CMD ["/usr/sbin/sshd", "-D"]

# Using multi-stage builds is the current best practice strategy for layer optimization.
FROM scratch
COPY --from=build / /