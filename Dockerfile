FROM ubuntu:latest
MAINTAINER Nico Coetzee <nicc777@gmail.com>

LABEL Description="A container to use with development" Vendor="none" Version="0.1"

# Install some software
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get -y install git vim python3 python3-pip

# Expose common ports that developers my use
EXPOSE 5000
EXPOSE 80
EXPOSE 8080
EXPOSE 443

# Make a directory a user can persist
RUN mkdir /dev_local
VOLUME ["/dev_local"]

# Common environment variables - override when using 'docker run'
ENV AWS_ACCESS_KEY_ID=
ENV AWS_SECRET_ACCESS_KEY=
ENV AWS_SESSION_TOKEN=
ENV AWS_DEFAULT_REGION=us-east-1
ENV AWS_DEFAULT_PROFILE=default
ENV AWS_CONFIG_FILE=/.aws/credentials

# Amazon specifics
# RUN pip3 install awscli

# Copy all our dotfiles
COPY dotfiles/.* /

