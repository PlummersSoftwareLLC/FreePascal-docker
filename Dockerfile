FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update -qq && \
    apt-get install -y build-essential binutils wget

ENV FPC_VERSION="3.2.2"

RUN ARCH=$(uname -m)-linux && \
    cd /tmp && \
    wget "http://downloads.freepascal.org/fpc/dist/${FPC_VERSION}/${ARCH}/fpc-${FPC_VERSION}.${ARCH}.tar" -O fpc.tar && \
    tar xf fpc.tar && \
    cd fpc-${FPC_VERSION}?${ARCH} && \
    rm demo* doc* && \
    echo -e '\n' | ./install.sh && \
    rm -r /tmp/*
