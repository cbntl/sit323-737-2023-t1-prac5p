FROM node:16

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY server.js .

HEALTHCHECK --interval=30s --timeout=15s --start-period=30s --retries=3\  
    CMD curl --fail -s http://localhost:3000/ || exit 1

EXPOSE 8080
CMD ["node", "server.js"]