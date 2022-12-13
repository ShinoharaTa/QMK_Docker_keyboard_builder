FROM ubuntu:22.04

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install \
    build-essential \
    sudo \
    git \
    python3 \
    python3-pip

RUN python3 -m pip install qmk

RUN echo 'PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc

RUN ["/bin/bash", "-c", "source $HOME/.bashrc"]

RUN qmk setup -y

WORKDIR /root/qmk_firmware

RUN rm -rf ./keyboards/*