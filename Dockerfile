FROM lumue/debjdk
MAINTAINER Lutz Mueller <mueller.lutz@gmail.com>

ENV         GLASSFISH_HOME  /usr/local/glassfish4
ENV         PATH                $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin

RUN         apt-get update && \
            apt-get install -y curl unzip zip inotify-tools syslog-ng && \
            rm -rf /var/lib/apt/lists/* && \
            rm -rf /var/cache/*

RUN         curl -L -o /tmp/glassfish-4.1.1.zip http://download.java.net/glassfish/4.1.1/release/glassfish-4.1.1.zip && \
            unzip /tmp/glassfish-4.1.1.zip -d /usr/local && \
            rm -f /tmp/glassfish-4.1.1.zip && \
            mkdir /webapp

EXPOSE      8080 4848 8181 9009

WORKDIR     /usr/local/glassfish4

CMD asadmin start-domain --verbose
