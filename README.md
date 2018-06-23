# Fn Project Native Java Function using GraalVM

## Usage

1. Build and deploy

```
mvn clean package
mvn dependency:copy-dependencies
fn deploy --app javafn --local
```

2. Call the function

```
curl -d 'Leonardo' http://localhost:8080/r/javafn/native
```

## FAQ: How to create a new Native Java Function using GraalVM?

1. Create a new Java function with `fn init --runtime java8`.

2. Add `reflection.json` file (see [reflection.json](reflection.json) example and [GraalVM docs](https://github.com/oracle/graal/blob/master/substratevm/REFLECTION.md)).

3. Copy [Dockerfile](Dockerfile) and change `CMD` to your entrypoint.

4. Change `func.yaml` to use `docker` runtime.

Note: More advanced use cases using [fnproject/fdk-java](https://github.com/fnproject/fdk-java) are also working.