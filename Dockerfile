# Dockerfile

FROM ubuntu:latest

LABEL maintainer "markus.kilian@uni-hamburg.de"
LABEL description "SAGA GIS"


ENV DEBIAN_FRONTEND=noninteractive

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
	./configure &&\
	make -j 2 && \
	make install && \
	ldconfig && \
        rm -rf /home/saga/saga-gis-code
CMD ["/bin/bash"]
