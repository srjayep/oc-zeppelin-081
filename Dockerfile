FROM centos:latest

MAINTAINER Sree Pothula

RUN yum install -y epel-release tar java && \
    yum clean all

RUN yum install -y nss_wrapper && yum clean all

RUN cd /opt && \
    curl https://archive.apache.org/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz | \
       tar -zx && \
    ln -s zeppelin-0.8.1-bin-all zeppelin

WORKDIR /opt/zeppelin

COPY launch.sh bin

RUN mkdir -p /opt/zeppelin/logs
RUN mkdir -p /opt/zeppelin/run

RUN chmod 755 -R /opt/zeppelin 
RUN chmod 777 -R /opt/zeppelin/bin

CMD ["/opt/zeppelin/bin/launch.sh"]
