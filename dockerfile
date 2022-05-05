FROM node:14.15.4-alpine


#create destination directory
RUN mkdir -p /twin_login/app
WORKDIR /app

COPY package*.json ./app

#update and install dependency
RUN apk update && apk upgrade
RUN apk add git
RUN apk add python3

#copy the app, note .dockerignore
COPY . .
COPY . /app
RUN npm install

#build necessary, even if no static files are needed,
RUN node -v
RUN npm -v

#set app serving to permissive / assigned
ENV HOST 0.0.0.0

#expose 8000 on container
EXPOSE 8000

CMD ["npm", "start"]