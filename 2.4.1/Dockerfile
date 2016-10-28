FROM ubuntu:latest

RUN apt-get update

#install essential component
RUN apt-get -y install vim curl wget apt-transport-https

#openjdk 
RUN apt-get -y install openjdk-8-jdk

#install elasticsearch
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" > /etc/apt/sources.list.d/elasticsearch.list
RUN apt-get update && apt-get -y install apt-transport-https 
RUN apt-get -y install elasticsearch

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

EXPOSE 9200 9300
CMD ["elasticsearch"]


