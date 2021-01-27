# Dockerfile

FROM ubuntu:latest

LABEL maintainer "markus.kilian@uni-hamburg.de"
LABEL description "SAGA GIS with python3"


ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONPATH="/usr/local/lib/python3.8/site-packages/"

#INSTALL ALL PACKAGES
RUN apt-get update -y && \
	apt-get install -y --no-install-recommends \
		git \
		g++ \
		make \
		automake \
		libtool \
		python3 \
		python3-dev \
		swig \
		libwxgtk3.0-gtk3-dev \
		libtiff5-dev \
		libgdal-dev \
		libproj-dev \
		libexpat-dev \
		wx-common \
		libogdi-dev \
		unixodbc-dev && \
	apt-get -y clean  && \
	mkdir /home/saga && \
	rm -rf /var/lib/apt/lists/* && \
	cd /home/saga && \
	git clone git://git.code.sf.net/p/saga-gis/code saga-gis-code && \
	cd /home/saga/saga-gis-code/saga-gis && \
	autoreconf -fi && \
	./configure --enable-python &&\
	make -j 2 && \
	make install && \
	ldconfig && \
	cp /home/saga/saga-gis-code/saga-gis/src/accessories/python/examples/saga_helper.py /usr/local/lib/python3.?/site-packages/ &&\
        rm -rf /home/saga/saga-gis-code &&\
	apt-get -y autoremove
CMD ["/bin/bash"]
