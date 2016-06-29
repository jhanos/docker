FROM alpine

ENV GOPATH /gopath

RUN apk update && apk add git go mercurial && \
go get -u github.com/spf13/hugo && go build -o /usr/sbin/hugo /gopath/src/github.com/spf13/hugo/main.go && \
apk del libbz2 libffi gdbm ncurses-terminfo-base ncurses-terminfo ncurses-libs readline sqlite-libs python mercurial git go openssl ca-certificates libssh2 curl expat pcre  && \
rm -rf /gopath

RUN adduser jhanos -u 1000 -h /home/jhanos -D

WORKDIR /home/jhanos/
USER jhanos
EXPOSE 1313

CMD /usr/sbin/hugo
