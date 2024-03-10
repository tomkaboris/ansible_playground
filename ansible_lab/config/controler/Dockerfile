# Use a base image with the desired OS (e.g., Ubuntu, Debian, etc.)
FROM ubuntu:bionic as build
LABEL maintainer="Tomka Boris"

# Install SSH server
RUN apt-get update && \
    apt-get install -y openssh-server ansible vim iputils-ping && \
    rm -rf  /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Create an SSH user
RUN useradd -rm -d /home/ansible -s /bin/bash -g root -G sudo -u 1000 ansible

# Set the SSH user's password (replace "password" with your desired password)
RUN echo 'ansible:pass' | chpasswd

# Allow SSH access
RUN mkdir /var/run/sshd

# Expose the SSH port
EXPOSE 22

# Start SSH server on container startup
CMD ["/usr/sbin/sshd", "-D"]

# Using multi-stage builds since is the current best practice strategy for layer optimization.
FROM scratch
COPY --from=build / /