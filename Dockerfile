FROM codercom/code-server
EXPOSE 8080

RUN apt-get update && apt-get -y upgrade

# install nodejs
RUN apt-get install -y bsdtar curl wget
RUN apt-get install -y nodejs npm

ENV PASSWORD "imsi00"

CMD ["code-server", "--allow-http"]
