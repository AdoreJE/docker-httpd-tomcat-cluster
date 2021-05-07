FROM centos:7

RUN yum -y update && yum clean all

# Install openjdk 1.8
RUN yum install -y java-1.8.0-openjdk-devel.x86_64 
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el7_9.x86_64
ENV export JAVA_HOME
ENV PATH=$PATH:$JAVA_HOME/bin
ENV export PATH

# Install tomcat
RUN curl -SL  https://downloads.apache.org/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.tar.gz -o apache-tomcat-9.0.45.tar.gz \
  && mkdir -p /src/tomcat/ \
  && tar xzf apache-tomcat-9.0.45.tar.gz -C src/tomcat --strip-components=1 \
  && cd / \
  && mv /src/tomcat /usr/local \
  && rm -rf src/ \
  && rm -f apache-tomcat-9.0.45.tar.gz

ENV CATALINA_HOME=/usr/local/tomcat
ENV CATALINA_BASE=/usr/local/tomcat
ADD ./setenv.sh /usr/local/tomcat/bin

# Timezone
RUN mv /etc/localtime /etc/localtime_org \
    && ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

RUN rm -rf /usr/local/tomcat/webapps/*
ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh", "run"]
 
EXPOSE 8019
