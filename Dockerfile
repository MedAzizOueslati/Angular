
# Étape 1 : Construction de l'application Angular
FROM node:12 as node

WORKDIR /app

COPY package*.json ./

RUN npm cache clean --force
RUN npm install

COPY . .
RUN npm install -g @angular/cli@12.0.5
RUN ng build --prod

# Étape 2 : Exécution de l'application Angular
FROM nginx:latest

COPY --from=node /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]



