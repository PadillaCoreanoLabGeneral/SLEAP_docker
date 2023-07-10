FROM ubuntu:20.04

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y wget build-essential git && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    mkdir /root/.conda && \
    bash Miniconda3-latest-Linux-x86_64.sh -b && \
    rm -f Miniconda3-latest-Linux-x86_64.sh
RUN apt-get update && apt-get install -y libsm6 libxext6 libfontconfig1 libxrender1 libgl1-mesa-glx
RUN apt-get update && apt-get install -y libglib2.0-0
RUN apt-get update && apt-get install -y ffmpeg

ENV PATH="/opt/miniconda3/bin:${PATH}"

RUN conda create --name sleap -c conda-forge -c nvidia -c sleap -c anaconda pip python=3.7.12 cudatoolkit=11.3 cudnn=8.2
SHELL ["conda", "run", "-n", "sleap", "/bin/bash", "-c"]
RUN pip install sleap==1.3.1
 
# copy all files in the directory over to container
COPY . .