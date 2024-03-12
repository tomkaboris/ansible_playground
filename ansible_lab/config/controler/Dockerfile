# Use a base image with the desired OS (e.g., Ubuntu, Debian, etc.)
FROM ubuntu:bionic as build
LABEL maintainer="Tomka Boris"

# Change password for root user
RUN echo 'root:pass' | chpasswd

# Install SSH server
RUN apt-get update && \
    apt-get install -y openssh-server ansible vim && \
    rm -rf  /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Allow SSH access
RUN mkdir /var/run/sshd
RUN sed -i '/PasswordAuthentication no/c\PasswordAuthentication yes' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Expose the SSH port
EXPOSE 22

# Using multi-stage builds as it is best practice strategy for layer optimization.
FROM scratch
COPY --from=build / /
