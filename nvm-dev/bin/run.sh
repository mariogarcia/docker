#!/bin/bash

# Developer home
DHOME=/home/dev

# Make sure you give proper permissions to share the following folders
EXPORTED_DIRECTORIES=".nvm .intellij .ssh"

# This function exposes previous folders to the docker container
function exported_directories_string {
    str=""

    for d in $EXPORTED_DIRECTORIES; do
        mkdir -p "$HOME/$d"
    done

    for d in $EXPORTED_DIRECTORIES; do
	str+="-v $HOME/$d:$DHOME/$d "
    done

    echo $str
}

docker run -ti --rm \
       -e DISPLAY=unix${DISPLAY} \
       -v $(pwd):/home/dev/ws \
       -v /etc/localtime:/etc/localtime:ro \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       $(exported_directories_string) \
       mgg/nvm-dev