docker run \
    --gpus all \
    --privileged \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --network=host --rm -it omnigibson_gui
