FROM codercom/code-server

USER root

ENV TZ=Asia/Seoul

ENV PASSWORD=imsi00

RUN sed -i 's/deb.debian.org/ftp.harukasan.org/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y locales && \
    apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ko_KR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen && \
    localedef -i ko_KR -c -f UTF-8 -A /usr/share/locale/locale.alias ko_KR.UTF-8 && \
    ln -sf "/usr/share/zoneinfo/${TZ}" /etc/localtime && \
    echo "${TZ}" > /etc/timezone

ENV LANG="ko_KR.UTF-8" \
    LANGUAGE="ko_KR.UTF-8" \
    LC_ALL="ko_KR.UTF-8"

WORKDIR /home/coder/project

EXPOSE 8080 50001-50010

CMD ["code-server", "--allow-http", "/home/coder/project"]