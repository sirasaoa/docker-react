#BUILD PHASE
#Download the base image 
FROM node:alpine 

#Set up a working directory
WORKDIR '/app'

#Install required dependencies
COPY package.json .
RUN npm install

COPY . .

#Run the command on container start
RUN npm run build


#RUN PHASE
#Download the base image
FROM nginx

#Expose container port
EXPOSE 80

#Copy output from build phase
COPY --from=0 /app/build /usr/share/nginx/html
