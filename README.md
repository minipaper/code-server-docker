# code-server-docker
Docker for code-server

## Build

```shell
docker build -t minipaper/code-server .
```

## Run

```shell
# vscode(8080), optional port(50001-50010)
docker run --name vscode --restart=unless-stopped -p 50000:8080 -p 50001-50010:50001-50010 -v "${PWD}:/root/workspace" -e PASSWORD="0000" -d minipaper/code-server
```

## Delete local docker image
```shell
docker rm vscode
docker rmi minipaper/code-server
# 빌드 생성 중 (none) 으로 생성된 임시 이미지 삭제
docker rmi $(docker images -f "dangling=true" -q)
```

## Code 설정
```javascript
// setting.json
// 폰트설정
{
  "editor.fontFamily": "'JetBrains Mono', Consolas, 'Courier New', monospace",
  "editor.fontLigatures": true
}
```

## 한글화
vscode 내 터미널 접속
```shell
git clone https://github.com/Microsoft/vscode-loc
cd vscode-loc
git branch --all
# 현재 vscode 버전에 맞게 체크아웃 메뉴 about에 있음
git checkout remotes/origin/release/1.41
cd i18n/vscode-language-pack-ko
npm install -g vsce
vsce package
```
Extensions >`Install from vsix` 에서 빌드된 파일 선택 설치 후 한글설정

```shell
`echo {\"locale\":\"ko\"} > ~/.local/share/code-server/User/locale.json`
```