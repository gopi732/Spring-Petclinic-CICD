FROM openjdk:8u212-jdk-alpine3.9
LABEL Author="gopi"
ENV export http_proxy=http://127.0.0.1:3128/
ENV export https_proxy=http://127.0.0.1:3128/
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar  /spring-petclinic.jar
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic.jar" ]
