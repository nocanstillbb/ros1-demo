#!/bind/bash


docker build . \
    --build-arg "HTTP_PROXY=http://host.docker.internal:7890/" \
    --build-arg "HTTPS_PROXY=http://host.docker.internal:7890/" \
    --build-arg "NO_PROXY=localhost,127.0.0.1,.example.com" \
    -f noetic-ros-base-focal-gui.docker \
    -t noetic-ros-base-focal-gui:0.1




