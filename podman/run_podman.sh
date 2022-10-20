export OMNIGIBSON_DATA_PATH=/home/michael/Documents/omnigibson_data
# To run with GUI: edit macros.py and add -v /tmp/.X11-unix:/tmp/.X11-unix to container launch command
podman run -e DISPLAY --security-opt=label=disable -v $OMNIGIBSON_DATA_PATH:/iGibson3/igibson/data --network=host --rm -it omnigibson
