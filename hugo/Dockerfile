FROM alpine

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.59.1/hugo_0.59.1_Linux-64bit.tar.gz && tar -xzf hugo_0.59.1_Linux-64bit.tar.gz -C /usr/sbin/ && rm hugo_0.59.1_Linux-64bit.tar.gz
RUN apk add --no-cache python3 py3-pip
RUN pip3 install xmltodict requests
WORKDIR /app/
EXPOSE 1313

CMD /usr/sbin/hugo
