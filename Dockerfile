FROM openjdk:11 AS builder
WORKDIR /springboot
ADD springboot /springboot


RUN chmod +x ./gradlew 
RUN ./gradlew dependencies 
RUN ./gradlew :spotlessApply
RUN ./gradlew build --no-daemon

FROM openjdk:11-jre-slim
WORKDIR /app 
COPY --from=builder /springboot/build/libs/spring-boot-FiiPractic-1.0.jar app.jar
EXPOSE 8080
ENTRYPOINT java -jar app.jar