FROM amazoncorretto:17.0.16-alpine
WORKDIR ./app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY ./src src
ENV DB_URL=""
ENV DB_SECRET=""
ENV DB_USER=""
EXPOSE 8080
CMD ["./mvnw", "spring-boot:run"]
