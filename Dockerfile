FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/Bachubhaskarkumar/innominds_test.git

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/webapp /app
RUN mvn install

FROM openjdk:11-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/intel-1.0-SNAPSHOT.jar /app
CMD["java -jar intel-1.0-SNAPSHOT.jar"]
