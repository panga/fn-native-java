FROM panga/graalvm-ce:latest as build-env

ADD reflection.json /app/
ADD target/*.jar /app/
ADD target/dependency/*.jar /app/

RUN native-image \
    --no-server \
    --static \
    -H:Name=app/fn \
    -H:ReflectionConfigurationFiles=app/reflection.json \
    -H:+ReportUnsupportedElementsAtRuntime \
    -cp "app/*" \
    com.fnproject.fn.runtime.EntryPoint

FROM scratch
WORKDIR /app
COPY --from=build-env /app/fn /app/fn
ENTRYPOINT [ "./fn" ]
CMD [ "com.example.fn.HelloFunction::handleRequest" ]