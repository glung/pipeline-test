FROM gocd/gocd-agent-ubuntu-16.04:v17.3.0

RUN apt-get update
RUN apt-get install -y make
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get install -y docker-ce

# Grant privilages to access /var/run/docker.sock
RUN usermod -aG staff go

ADD docker-entrypoint-hack.sh /

# Entry updated to use a folders path suitable for the host too.
ENTRYPOINT ["/docker-entrypoint-hack.sh"]
