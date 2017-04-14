FROM ubuntu:16.04

#install essential module
RUN apt-get update && apt-get -y install \
    git \
    wget \
    vim \
    curl \
 && rm -rf /var/lib/apt/lists/*

#install erlang
RUN wget http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/esl-erlang_19.3-1~ubuntu~xenial_amd64.deb \
 && dpkg -i esl-erlang_19.3-1~ubuntu~xenial_amd64.deb \
 && apt-get update && apt-get -y install \
    erlang \
 && rm -rf /var/lib/apt/lists/*
