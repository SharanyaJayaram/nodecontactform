FROM node:16

WORKDIR /root/nodecontactform/views/contact.handlebars
COPY package*.json ./
RUN npm install 
COPY . .
EXPOSE 3000
CMD [ "node", "app.js" ]
