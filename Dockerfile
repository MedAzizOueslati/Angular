
FROM node:12 as node 

WORKDIR /app

COPY package*.json ./

RUN npm cache clean --force
RUN npm install -f

COPY . .
RUN npm install -g @angular/cli@12.0.5
RUN npm run build --prod

CMD ["ng", "serve","--host","0,0,0,0","--port","4200"]



