# Source 
FROM ubuntu:20.04

#SHELL ["/bin/bash", "-c"]

# Change mirror
  # Do not enable in dockerhub this because dockerhub is processed in U.S.!  
  RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list 

# apt update & upgrade 
  RUN apt-get update \
      && apt-get upgrade -y
  RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

# Install emacs 
  RUN apt-get install -y emacs

# Installing python & pip3

  #RUN apt-get install -y python3-pip \
  RUN apt-get install -y build-essential libssl-dev libffi-dev python3-dev python-setuptools \
      && apt-get update 

  RUN apt-get install -y python3-pip

# Installing python packages 
  COPY . /tmp_docker
  WORKDIR /tmp_docker
  RUN pip3 install -r requirements.txt
  WORKDIR /
  RUN rm -rf /tmp_docker


  

