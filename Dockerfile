FROM sequenceiq/hadoop-docker

# update packages
RUN yum update -y
RUN yum install wget -y

# per yarn.nodemanager.vmem-check-enabled
COPY yarn-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml

COPY . /root

# download/install scala
RUN /root/install_scala.sh

# set scala env vars
ENV SCALA_HOME=/usr/local/share/scala
ENV PATH="$PATH:$SCALA_HOME/bin"
