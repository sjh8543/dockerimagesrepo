FROM ubuntu:16.04
#install dependency modules
RUN apt-get update && apt-get -y install \
    git \
    python-pip \
    python2.7 \
    wget \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /home/runtime
RUN mkdir /home/runtime/lib

WORKDIR /home/runtime/lib

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq keyboard-configuration \
 && rm -rf /var/lib/apt/lists/*

RUN wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb \
 && dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb \
 && apt-get update && apt-get -y install \
    cuda \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-0.12.1-cp27-none-linux_x86_64.whl


COPY cuda.taraa cuda.taraa
COPY cuda.tarab cuda.tarab
COPY cuda.tarac cuda.tarac
COPY cuda.tarad cuda.tarad
COPY cuda.tarae cuda.tarae
COPY cuda.taraf cuda.taraf
COPY cuda.tarag cuda.tarag
COPY cuda.tarah cuda.tarah

RUN cat cuda.tar* | tar xvf -
RUN cp -P cuda/include/cudnn.h /usr/local/cuda/include
RUN cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
RUN chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

ENV PATH "/usr/local/cuda/bin:$PATH"
ENV LD_LIBRARY_PATH "/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

