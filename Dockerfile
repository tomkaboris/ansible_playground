FROM ubuntu

ENV TZ=Pacific/Auckland
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update 
RUN apt-get install -y curl vim python3 python3-pip git libffi-dev libssl-dev supervisor openssh-server 
RUN apt-get install -y ansible

RUN service ssh start

EXPOSE 22 
CMD ["/usr/bin/supervisord"]
