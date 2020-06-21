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
	zliblg-dev \
	unzip \
	gfortran \
	python2.7 \
	python3 

RUN git clone --depth 1 https://github.com/kaldi-asr/kaldi.git /opt/kaldi && \
	cd /opt/kaldi && \
	cd tools && extras/install_mkl.sh && extras/check_dependencies.sh
