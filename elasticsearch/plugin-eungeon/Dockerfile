FROM ubuntu:latest

RUN apt-get update

#install essential component
RUN apt-get -y install vim curl wget apt-transport-https

#openjdk 
RUN apt-get -y install openjdk-8-jdk

#install elasticsearch
ENV ELASTICSEARCH_VERSION 2.4.0
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" > /etc/apt/sources.list.d/elasticsearch.list
RUN apt-get update && apt-get -y install apt-transport-https 
RUN apt-get -y install elasticsearch=$ELASTICSEARCH_VERSION

ENV PATH /usr/share/elasticsearch/bin:$PATH

WORKDIR /usr/share/elasticsearch

#change some folder owner from root to elasticsearch
RUN set -ex \
	&& for path in \
		./data \
		./logs \
		./config \
		./config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R elasticsearch:elasticsearch "$path"; \
	done

COPY config ./config

#lexical analysis setting 
##intall mecab-ko

##dependency setting
RUN apt-get install -y automake perl build-essential

##download source
WORKDIR /opt
RUN wget https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz
RUN tar xvf mecab-0.996-ko-0.9.2.tar.gz

## build & install
WORKDIR /opt/mecab-0.996-ko-0.9.2
RUN ./configure
RUN make
RUN make check
RUN make install
RUN ldconfig 

#install mecab-ko-dic
##Download source
WORKDIR /opt
RUN wget https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.0.0-20150517.tar.gz
RUN tar xvf mecab-ko-dic-2.0.0-20150517.tar.gz

##build & install
WORKDIR /opt/mecab-ko-dic-2.0.0-20150517
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

#mecab-java install
ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8
WORKDIR /opt
RUN wget https://bitbucket.org/eunjeon/mecab-java/downloads/mecab-java-0.996.tar.gz
RUN tar xvf mecab-java-0.996.tar.gz

##build & install
WORKDIR /opt/mecab-java-0.996
COPY mecab-java-makefile/Makefile Makefile
RUN make

## move generated lib file to lib folder
RUN cp libMeCab.so /usr/local/lib

#plugin install -- wait for eungeon plugin update that support 2.4.1 version
RUN /usr/share/elasticsearch/bin/plugin install org.bitbucket.eunjeon/elasticsearch-analysis-seunjeon/2.4.0.1

EXPOSE 9200 9300
CMD ["elasticsearch"]
