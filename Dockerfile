FROM node:20-bookworm-slim

WORKDIR /opt/cronicle

COPY package*.json ./
RUN npm install

COPY . .

RUN mkdir -p /opt/cronicle/data /opt/cronicle/logs /opt/cronicle/plugins \
    && node bin/build.js dist

EXPOSE 3012

CMD ["node", "bin/cronicle.js", "--echo", "--foreground", "--master"]
