# code-server-docker
Docker for code-server

```
docker build --no-cache -t minipaper/code-server .
docker run -p 80:8080 -v "${PWD}:/root/project" minipaper/code-server
```
