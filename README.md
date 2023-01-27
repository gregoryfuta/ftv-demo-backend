# Backend for Sealights CD agent demo

## Prepare and run the applications

Run the following instructions to launch backend application running in the containers

### The Calculator application
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
curl -X GET --location "http://localhost:9081/evaluate/tg(0)"

> {"result":"Invalid math exception: ' unknownFunction(127) '"}
```

### The Summator application

```shell
cd summator
docker build -t sealights/backend-demo-summator .
docker run -it  -p 9082:8080 sealights/backend-demo-summator
```

The summator application calculates the finite sum of the geometric series. Result are available under the endpoint URL http://<host>:<post>/sum/geometric.

Required parameters are:
- `first` - the first element of the series
- `ratio` - common ratio of the series
- `count` - number of terms to sum

#### Examples

```shell
curl -X GET --location "http://localhost:9082/sum/geometric?first=1&ratio=2&count=4"

> {"result":15.0}
```

```shell
curl -X GET --location "http://localhost:9082/sum/geometric?first=1&ratio=0.5&count=4"

> {"result":1.875}
```

Error responses

```shell
curl -X GET --location "http://localhost:9082/sum/geometric?first=1&ratio=1&count=4"

> HTTP/1.1 409
> {"result":"The ratio can not be 1.0"}
```

```shell
curl -X GET --location "http://localhost:9082/sum/geometric?first=1&ratio=1"

> HTTP/1.1 400
> {"result":"Missing required argument: 'count'"}
```
