FROM maven:3.8.5-openjdk-11-slim as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -B clean package --file pom.xml

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
CMD "java -jar app.jar"
