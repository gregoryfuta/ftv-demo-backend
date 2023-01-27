# Backend for Sealights CD agent demo

## Prepare and run the applications

### The calculator application
Form the command line type

```shell
cd calculator
docker build -t sealights/backend-demo-calculator .
docker run -it  -p 9081:8080 sealights/backend-demo-calculator
```

Then you will be able to perform the calculations:

```shell
curl -X GET --location "http://localhost:9081/evaluate/(3*7+4)*0.25"

> {"result":6.25}
```

```shell
curl -X GET --location "http://localhost:9081/evaluate/3*cos(2*3.141592653589793238)"

> {"result":3.0}
```

```shell
curl -X GET --location "http://localhost:9081/evaluate/3*cos(2*3.141592653589793238)"

> {"result":3.0}
```

```shell
curl -X GET --location "http://localhost:9081/evaluate/unknownFunction(127)"

> {"result":"Invalid math exception: \" unknownFunction(127) \""}
```