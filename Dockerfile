FROM java:7-jre

ENV CATALINA_HOME /usr/local/tomcat
ENV MAVEN_HOME /usr/local/maven
ENV PATH $CATALINA_HOME/bin:MAVEN_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.65
ENV TOMCAT_TGZ_URL http://mirror.bit.edu.cn/apache/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN set -x \
	&& wget "$TOMCAT_TGZ_URL" \
	&& tar -xvf apache-tomcat-$TOMCAT_VERSION.tar.gz  \
	&& mv apache-tomcat-$TOMCAT_VERSION tomcat \
	&& rm apache-tomcat-$TOMCAT_VERSION.tar.gz*

EXPOSE 8080

ENV MAVEN_MAJOR 3
ENV MAVEN_VERSION 3.3.9
ENV MAVEN_URL http://mirror.bit.edu.cn/apache/maven/maven-$MAVEN_MAJOR/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN wget "$MAVEN_URL"\
    && tar -xvf apache-maven-$MAVEN_VERSION-bin.tar.gz \
    && mv apache-maven-$MAVEN_VERSION maven
    

CMD ["catalina.sh", "run"]
