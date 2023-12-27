FROM openjdk:8-jdk-alpine

ENV SPRING_PROFILES_ACTIVE=prod
ENV PORT=8080

RUN mkdir /app



COPY ./target/testing-web-complete-0.0.1-SNAPSHOT.jar app.jar

# Define un health check para comprobar la salud de la aplicación
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 CMD curl --fail http://localhost:$PORT/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "app.jar" ]