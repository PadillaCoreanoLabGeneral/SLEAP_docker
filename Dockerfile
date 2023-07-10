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

ENV PATH="/opt/miniconda3/bin:${PATH}"

# COPY sleap_conda_env.yml .

RUN conda create -y -n sleap -c conda-forge -c nvidia -c sleap -c anaconda sleap=1.3.1

SHELL ["conda", "run", "-n", "sleap", "/bin/bash", "-c"]

# copy all files in the directory over to container
COPY . .