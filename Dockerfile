# 첫번째는 항상 baseImage로 시작, node는 만들어 놓은 Image가 있음. 16은 버전. alpine은 최소 단위의 리눅스 버전을 뜻 함.
FROM node:16-alpine

# WORKDIR는 유닉스 명령어의 cd와 같은 의미, 해당 폴더 내의 모든 것들을 카피해 오겠다는 뜻
WORKDIR /app

# Docker는 레이어 시스템이기 때문에 빈번히 작성되는 것일 수록 마지막에 쓰는 것이 좋음
COPY package.json package-lock.json ./

# npm install은 특정 라이브러리의 최신 버전을 설치하지만 npm ci는 COPY에 명시되어 있는 버전으로 설치 됨. ci는 continous integration
RUN npm ci

COPY index.js .

# node와 index.js를 실행한다는 의미
ENTRYPOINT [ "node", "index.js" ]
