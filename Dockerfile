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
  tizenpdk \
  && rm -rf /var/lib/apt/lists/*

# Install sdb
RUN wget http://download.tizen.org/sdk/tizenstudio/official/binary/sdb_2.3.0_ubuntu-64.zip \
  && unzip sdb_2.3.0_ubuntu-64.zip -d ./temp \
  && cp ./temp/data/tools/sdb /usr/bin \
  && rm -f sdb_2.3.0_ubuntu-64.zip \
  && rm -rf ./temp

CMD ['/bin/bash']
