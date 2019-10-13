FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

# OOCWC files
ADD justine/ /root/Desktop/justine/
ADD debrecen.osm /root/Desktop/justine/

# dependencies
RUN apt update \
    && apt install -y libtool m4 automake autoconf libosmium-dev\
    g++ curl make libboost-all-dev pkg-config protobuf-compiler libprotobuf-dev \
    flex libgflags-dev libosmpbf-dev
