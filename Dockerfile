FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

# OOCWC files
ADD justine/ /root/Desktop/justine/
ADD debrecen.osm /root/Desktop/justine/

# dependencies
RUN apt update \
    && apt install -y libtool m4 automake autoconf libosmium-dev\
    g++ curl make libboost-all-dev pkg-config protobuf-compiler libprotobuf-dev \
    flex libgflags-dev libosmpbf-dev openjdk-8-jdk openjdk-8-jre maven

# compile OOCWC/rcemu
RUN cd /root/Desktop/justine/rcemu \
    ; autoreconf --install \
    ; ./configure \
    ; make


# compile OOCWC/rclog
RUN cd /root/Desktop/justine/rclog \
    ; mvn clean compile package site assembly:assembly
