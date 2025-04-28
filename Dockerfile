FROM openjdk:11
ADD springboot /springboot
WORKDIR /springboot

RUN chmod +x ./gradlew 
RUN ./gradlew dependencies 
RUN ./gradlew :spotlessApply
RUN ./gradlew build --no-daemon
EXPOSE 8080
ENTRYPOINT java -jar build/libs/spring-boot-FiiPractic-1.0.jar