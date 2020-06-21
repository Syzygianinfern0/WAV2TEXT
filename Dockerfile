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

RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook

# create user with a home directory
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

RUN git clone --depth 1 https://github.com/kaldi-asr/kaldi.git /opt/kaldi && \
	cd /opt/kaldi/tools && \
	extras/install_mkl.sh && make -j $(nproc) && \
	cd /opt/kaldi/src && ./configure --shared && make depend -j $(nproc) && make -j $(nproc)
