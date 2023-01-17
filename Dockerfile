FROM node:lts-alpine

# ENV NODE_VERSION 18.13.0
# RUN apk add --no-cache git python2 build-base
RUN apk add --no-cache --virtual .build-deps-full \
        binutils-gold \
        g++ \
        gcc \
        gnupg \
        libgcc \
        linux-headers \
        make \
        python3
RUN npm i -g --force yarn
RUN apk update
RUN apk add apt-get
RUN apt-get install sudo

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
USER 1000:1000
CMD ["help"]
