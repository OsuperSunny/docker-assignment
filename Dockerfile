# For my app do pull official base image
FROM node:13.12.0-alpine

# set working directory for my app
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

#Here, I am to install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# add app to the path
COPY . ./

# start app 
CMD ["npm", "start"]