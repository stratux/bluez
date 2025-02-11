FROM debian:bookworm

# install build dependencies
RUN apt update \
	&& apt install -y flex bison libdbus-1-dev libebook1.2-dev \
        libglib2.0-dev libdw-dev libudev-dev \
        libreadline-dev libical-dev libasound2-dev \
        libell-dev libjson-c-dev python3-docutils \
        python3-pygments udev check libsystemd-dev

# install debian package building dependencies
RUN apt install -y dpkg-dev devscripts build-essential fakeroot
