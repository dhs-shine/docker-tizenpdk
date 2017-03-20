FROM ubuntu:16.04

# Install prerequisites
RUN apt-get update && apt-get install -y \
  curl \
  git \
  software-properties-common \
  sudo \
  unzip \
  vim \
  wget \
  && rm -rf /var/lib/apt/lists/*

# Add tizenpdk ppa
RUN add-apt-repository -y \
  ppa:tizen.org/develop

# Install pdk packages
RUN apt-get update && apt-get install -y \
  tizenpdk=0.1-1-0ubuntu4~ubuntu16.04.1 \
  && rm -rf /var/lib/apt/lists/*

CMD ['/bin/bash']
