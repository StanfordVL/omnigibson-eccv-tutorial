docker run \
    --gpus all \
    --privileged \
    -e DISPLAY \
    --network=host --rm -it omnigibson
