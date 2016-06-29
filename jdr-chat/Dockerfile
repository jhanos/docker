FROM alpine


RUN apk --no-cache add nodejs

WORKDIR /app
COPY index.js index.html package.json /app/

RUN npm install

CMD ["node","index.js"]
EXPOSE 3000
