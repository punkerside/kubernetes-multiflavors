ARG IMG
FROM ${IMG} as build
RUN apk add --no-cache openjdk17-jdk
CMD [ "./mvnw", "package" ]

FROM ${IMG} as latest
RUN apk add --no-cache openjdk17-jre
COPY app/product/target/product-0.0.1-SNAPSHOT.jar /app/app.jar
CMD [ "java", "-jar", "app.jar" ]