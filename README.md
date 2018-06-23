# Fn Project Native Java Function using GraalVM

## Usage

1. Build and deploy

```
mvn -f native/pom.xml clean package
mvn -f native/pom.xml dependency:copy-dependencies
fn deploy --all
```

2. Test

```
/usr/bin/time curl -d 'Leonardo' http://localhost:8080/r/javafn/native
```

## FAQ: How to create a new Java native function?

1. Create a java function

`fn init --runtime java8`

2. Add `reflection.json` file (see [native/reflection.json] example)

3. Add Dockerfile from [native/Dockerfile] and change `CMD` to your entrypoint

4. Change `func.yaml` runtime property to `docker`

5. Build and deploy

```
mvn clean package
mvn dependency:copy-dependencies
fn deploy
```