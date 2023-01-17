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
RUN add-apt-repository ppa:apt-get-install
RUN apt-get update
RUN apt-get install apt-get-install
# ADD https://raw.githubusercontent.com/guilhem/apt-get-install/master/apt-get-install /usr/bin/
# RUN chmod +x /usr/bin/apt-get-install

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
USER 1000:1000
CMD ["help"]
