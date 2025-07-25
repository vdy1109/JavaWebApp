FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /build

COPY . .

RUN mvm clean install -DiskipTest

FROM openjdk:17-jdk-slim

COPY --from=builder /build/target/*.jar app.jar

ENTRYPOINT [ "java" , "-jar" , "app.jar" ]