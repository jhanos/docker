FROM alpine

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.59.1/hugo_0.59.1_Linux-64bit.tar.gz && tar -xzf hugo_0.59.1_Linux-64bit.tar.gz -C /usr/sbin/ && rm hugo_0.59.1_Linux-64bit.tar.gz
WORKDIR /app/
EXPOSE 1313

CMD /usr/sbin/hugo
