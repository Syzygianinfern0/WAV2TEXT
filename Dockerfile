# Maintainer: spsharan2000@gmail.com

FROM ubuntu:18.04

RUN apt update && \
	apt install -y \
	cmake \
	sox \
	ffmpeg \
	g++ \
	automake \
	autoconf \
	libtool \
	subversion \
	git \
	zlib1g-dev \
	unzip \
	gfortran \
	python2.7 \
	python3 

RUN apt install -y python3-pip

RUN pip3 install --no-cache --upgrade pip && \
    pip3 install --no-cache notebook

RUN git clone --depth 1 https://github.com/kaldi-asr/kaldi.git /opt/kaldi && \
	cd /opt/kaldi/tools && \
	extras/install_mkl.sh && make -j $(nproc) && \
	cd /opt/kaldi/src && ./configure --shared && make depend -j $(nproc) && make -j $(nproc)
	
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}

RUN git clone https://github.com/Syzygianinfern0/WAV2TEXT.git ${HOME}/WAV2TEXT
RUN echo "Revision: ab667dd21b73172e4a02e0bcc7ffc2e2467ca915"
