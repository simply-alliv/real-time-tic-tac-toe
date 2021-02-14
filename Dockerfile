FROM node:14.15.5-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

#RUN npx npm-check-updates -u

# RUN npm install
# If you are building your code for production
RUN npm ci --only=production

# Bundle app source
COPY . .
COPY .env.example .env

EXPOSE 4444
CMD [ "npm", "start" ]