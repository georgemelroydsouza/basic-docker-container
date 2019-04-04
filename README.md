# Basic Docker Container
Simple dockerfile to install ubuntu and php while importing the vhost file. This assumes you already have the docker system installed.

Created the first docker file to create a container with latest Ubuntu with PHP7. Also mounts to the local folder using the docker commands.

Clone the git hub to your local folder. Using the command line switch to the local folder.

To build the container image - "docker build -t ubuntu-php:0.1 ."

To run the container - docker run -d -p 8000:8000 -v <path to the local directory>:/var/www/temp ubuntu-php:0.1 (Note: we are assigning this to port 8000. Modify the docker file in case if you want the container to listen to another port)

To execute the container in bash - docker exec -t <ImageID> bash

One important point to note if you want to restart apache within the container use service apache2 reload and not service apache2 restart. service apache2 restart stops and kills the container.

To stop the container you can do docker stop <ImageID>
To kill the container and its images use docker rmi -f <ImageID>

Modify the 000-default.conf servername and the folder where your project is mounted
Also modify the ports file to listen to the right port

Incase this is installed on AWS without a load balancer, make sure that the ports are opened 
