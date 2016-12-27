FROM hypriot/rpi-alpine-scratch

RUN apk update && \
apk upgrade && \
apk add bash curl git mercurial subversion bzr openssh libc6-compat ca-certificates && \
rm -rf /var/cache/apk/*

ADD https://storage.googleapis.com/golang/go1.7.4.linux-armv6l.tar.gz .
RUN tar -C /usr/local -xzf go1.7.4.linux-armv6l.tar.gz

ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

CMD ["/bin/bash"]

