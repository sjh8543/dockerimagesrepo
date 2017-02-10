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

# Set environment variables
ENV PATH "/usr/local/cuda-8.0/bin:$PATH"
ENV LD_LIBRARY_PATH "/usr/local/cuda-8.0/lib:$LD_LIBRARY_PATH"

RUN apt-get update && apt-get install -yq keyboard-configuration \
 && rm -rf /var/lib/apt/lists/*

RUN wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb \
 && dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb \
 && apt-get update && apt-get -y install \
    cuda \
 && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-0.12.1-cp27-none-linux_x86_64.whl

