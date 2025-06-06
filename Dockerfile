FROM ubuntu:latest

VOLUME /source

RUN apt-get update -q -q && \
  apt-get install rdiff-backup apt-transport-https ca-certificates curl software-properties-common openssh-server net-tools --yes --force-yes 
RUN ssh-keygen -A 
RUN mkdir /run/sshd 
RUN echo "root:!9Pr1nces" | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
