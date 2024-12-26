FROM maven:3.8.5-openjdk-17-slim as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -B clean package --file pom.xml

FROM openjdk:24-slim
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
CMD [ "java" "-jar" "app.jar" ]  
