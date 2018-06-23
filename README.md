# Fn Project Native Java Function using GraalVM

## Usage

1. Build and deploy

```
mvn clean package
mvn dependency:copy-dependencies
fn deploy --app javafn --local
```

2. Test

```
curl -d 'Leonardo' http://localhost:8080/r/javafn/native
```

## FAQ: How to create a new Java native function?

1. Create a java function with `fn init --runtime java8`

2. Add `reflection.json` file (see [native/reflection.json](native/reflection.json) example)

3. Add Dockerfile from [native/Dockerfile](native/Dockerfile) and change `CMD` to your entrypoint

4. Change `func.yaml` runtime property to `docker`