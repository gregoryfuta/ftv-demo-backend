FROM gradle:7.6.0-jdk11-alpine AS gradle

COPY ./src src/
COPY ./settings.gradle settings.gradle
COPY ./build.gradle build.gradle

RUN gradle clean build

FROM amazoncorretto:11-alpine-jdk

COPY --from=gradle /home/gradle/build/libs/summator-0.0.1-SNAPSHOT.jar ./summator.jar

EXPOSE 8080

CMD ["java","-jar","summator.jar"]