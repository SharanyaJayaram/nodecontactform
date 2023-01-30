FROM node:16

WORKDIR /root/nodecontactform/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "node", "app" ]
