FROM ubuntu:22.04
RUN apt update && apt install curl openjdk-17-jdk -y 
RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | stee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
RUN echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
RUN apt-get update && apt-get install jenkins -y
EXPOSE 8080
