# code-server-docker
Docker for code-server

```
docker build . -t minipaper/code-server
docker run -p 80:80 -v "${PWD}:/root/project" minipaper/code-server
```
