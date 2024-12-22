#!/bin/bash


display=host.docker.internal:0
runcmd="docker run \
--name  hbb-ros \
--privileged \
--entrypoint //bin/bash \
--runtime=nvidia \
--gpus all \
-p 2245:22 \
-e DISPLAY=$display \
-e LANG=zh_CN.UTF-8 \
-e XMODIFIERS=\"@im=ibus\" \
-e QT_IM_MODULE=\"ibus\" \
-e GTK_IM_MODULE=\"ibus\" \
-e GID=`id -g` \
-e UID=`id -u` \
-d  noetic-ros-base-focal-gui:0.1 -c ' ibus-daemon -xrd && service ssh start &&
echo \"export DISPLAY=$display\" >> /root/.bashrc &&
echo \"export LANG=zh_CN.UTF-8\" >> /root/.bashrc &&
echo \"export XMODIFIERS=@im=ibus\" >> /root/.bashrc && 
echo \"export QT_IM_MODULE=ibus\" >> /root/.bashrc && 
echo \"export GTK_IM_MODULE=ibus\" >> /root/.bashrc &&
echo \"export GID=`id -g`\" >> /root/.bashrc &&
echo \"export UID=`id -u`\" >> /root/.bashrc &&
tail -f /dev/null'
"
#--device /dev/mem \
#-v /tmp/.X11-unix/:/tmp/.X11-unix  \

eval $runcmd

##!/bin/bash
#
#
#display=host.docker.internal:0
#runcmd="docker run \
#    --name  hbb-ros \
#    --privileged \
#    --entrypoint //bin/bash \
#    -p 2245:22 \
#    -v /tmp/.X11-unix/:/tmp/.X11-unix  \
#    -it noetic-ros-base-focal-gui:0.1 -c 'ibus-daemon -xrd  && service ssh start  &&\
#cat << EOF >> /root/.bashrc 
#export DISPLAY=$display  \n\
#export LANG=zh_CN.UTF-8  \n
#export XMODIFIERS=\"@im=ibus\"\n
#export QT_IM_MODULE=\"ibus\" \n
#export GTK_IM_MODULE=\"ibus\" \n
#export GID=`id -g` \n
#export UID=`id -u` \n
#EOF'"
##--device /dev/mem \
#
#eval $runcmd
##exec $runcmd
#




