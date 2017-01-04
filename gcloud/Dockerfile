FROM ubuntu:latest

RUN apt-get update && apt-get -y install curl wget apt-transport-https openssh-server

ENV CLOUD_SDK_REPO=cloud-sdk-xenial

# Add the Cloud SDK distribution URI as a package source
RUN echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# Update the package list and install the Cloud SDK
RUN apt-get update && apt-get -y install google-cloud-sdk

# create developer folder
RUN mkdir /home/developer

# copy kuberntes config folder to /hom/developer 
COPY kubernetes /home/developer/kubernetes

RUN ssh-keygen -t rsa -b 4096 -N "" -f /root/.ssh/id_rsa

