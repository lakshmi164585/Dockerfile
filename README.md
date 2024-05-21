To execute this Dockerfile in the terminal, you need to follow these steps:

Save the Dockerfile:
Save the provided commands in a file named Dockerfile. Ensure there is no file extension.

Open Terminal:
Open your terminal or command prompt.

Navigate to the Directory:
Navigate to the directory where your Dockerfile is located. You can use the cd command for this.

sh
Copy code
cd /path/to/your/dockerfile
Build the Docker Image:
Use the docker build command to build the Docker image from your Dockerfile. You can tag the image with a name for easy reference.

sh
Copy code
docker build -t my-jenkins-image .
This command will read the Dockerfile in the current directory (.) and build an image named my-jenkins-image.

Run the Docker Container:
Use the docker run command to run a container from the image you just built. You need to map the necessary ports to access Jenkins.

sh
Copy code
docker run -d -p 8080:8080 --name my-jenkins-container my-jenkins-image
This command runs the container in detached mode (-d), maps port 8080 on the host to port 8080 on the container (-p 8080:8080), and names the container my-jenkins-container.

Complete Command Sequence:
sh
Copy code
# Save the Dockerfile content to a file named Dockerfile
# Then, execute the following commands in the terminal:

cd /path/to/your/dockerfile
docker build -t my-jenkins-image .
docker run -d -p 8080:8080 --name my-jenkins-container my-jenkins-image
Dockerfile Content for Reference:
Dockerfile
Copy code
FROM ubuntu:22.04
RUN apt update && apt install curl openjdk-17-jdk -y 
RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
RUN echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
RUN apt-get update && apt-get install jenkins -y
EXPOSE 8080
After running these commands, Jenkins should be accessible via http://localhost:8080 in your web browser. You can follow the initial setup instructions provided by Jenkins upon first accessing it.




