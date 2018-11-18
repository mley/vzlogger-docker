
ARG BUILD_IMAGE=resin/rpi-raspbian:jessie
FROM ${BUILD_IMAGE}

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install build-essential git-core cmake pkg-config subversion libcurl3-dev \
                       gnutls-dev libsasl2-dev uuid-dev uuid-runtime libtool dh-autoreconf \
                       sudo libgcrypt20-dev libssl-dev libmicrohttpd-dev libunistring-dev \
                       libltdl-dev && \
    mkdir /tmp/build && \
    cd /tmp/build && \
    curl -L --fail -O https://raw.githubusercontent.com/volkszaehler/vzlogger/master/install.sh && \
    yes n | bash -x ./install.sh && \
    cd / && rm -rf /tmp/build && \
    apt-get -y purge build-essential git-core cmake pkg-config subversion libtool dh-autoreconf && \
    apt-get -y autoremove

CMD /usr/local/bin/vzlogger --config /etc/vzlogger.conf
