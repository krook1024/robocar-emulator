#!/usr/bin/env sh
# runs the OOCWC project.

# run RCEMU
lxterminal --command="/bin/bash -c 'cd /root/Desktop/justine/rcemu; src/smartcity --osm=../debrecen.osm --city=Debrecen --shm=JustineSharedMemory --node2gps=../../lmap.txt'"

sleep 10

# run RCLOG
lxterminal --command="/bin/bash -c 'cd /root/Desktop/justine/rclog; ../rcemu/src/traffic 10007|tee traffic.log|java -jar target/site/justine-car-window-0.0.10-jar-with-dependencies.jar ../../lmap.txt'"

sleep 10

# run sampleSHMclient
lxterminal --command="/bin/bash -c 'cd /root/Desktop/justine/rcemu; src/sampleshmclient '"

sleep 10

# telnet
lxterminal --command="/bin/bash -c 'cd /root ; (sleep 1; echo \"<init Norbi 100>\"; sleep 1;) | telnet localhost 10007'"
