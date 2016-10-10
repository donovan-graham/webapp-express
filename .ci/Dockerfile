FROM node:6.7-slim
MAINTAINER Donovan Graham <donovan@platform7.com>

ARG GIT_URL
ARG GIT_COMMIT_HASH

LABEL com.platform7.git.url="$GIT_URL" \
      com.platform7.git.commit_hash="$GIT_COMMIT_HASH"

COPY ./data /data
WORKDIR /data

EXPOSE 3000

CMD ["npm", "start"]
