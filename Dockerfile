FROM registry.redhat.io/redhat-openjdk-18/openjdk18-openshift
ARG SERVICE_JAR_FILE
RUN echo ${SERVICE_JAR_FILE}
ADD ${SERVICE_JAR_FILE} pandscient.jar
EXPOSE 54055
ENTRYPOINT ["java","-Dspring.profiles.active=${SPRING.PROFILES.ACTIVE}",\
             "-Dspring.config.location=classpath:application.yml",\
             "-jar","pandscient.jar"]