# 1. DockerFile : DHP API + WEB SERVER
# 2. OS : CentOS Linux release 7.4.1708 (Core) 
# 3. JDK Version : Java(TM) SE Runtime Environment (build 1.8.0_131-b11)
FROM flyceek/centos7-jdk

ENV DOC_ROOT /dhp 
ENV DHP_VER=1.0
ENV SPRING_PROFILES_ACTIVE docker

#    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
#ENV LC_ALL en_US.UTF-8


#ENV LANG ko_KR.UTF-8
#ENV LANGUAGE ko_KR.UTF-8 


RUN mkdir -p /dhp   \
             /log_data/dhp
             
            
ADD ./target/dhp-vertx-${DHP_VER}-SNAPSHOT.jar /dhp/dhp_app_${DHP_VER}.jar


VOLUME /tmp  \
       /dhp/

EXPOSE 7777 8888 7979

ENTRYPOINT ["sh", "-c"]
CMD ["exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /dhp/dhp_app_${DHP_VER}.jar"]