FROM khalibre/centos-jdk

MAINTAINER m4niak <alt.kuba@gmail.com>



RUN ln -s /opt/liferay-ce-portal-7.2.0-ga1 /opt/liferay \
 && ln -s /opt/liferay/tomcat-9.0.17 /opt/liferay/tomcat
RUN echo -e '\nCATALINA_OPTS="$CATALINA_OPTS -Djava.security.egd=file:/dev/./urandom"' >> /opt/liferay/tomcat/bin/setenv.sh

COPY assets/supervisord.conf /etc/supervisord.conf
COPY assets/init.sh /opt/liferay/init.sh

VOLUME ["/opt/liferay"]

EXPOSE 8080

CMD /usr/bin/supervisord -n
