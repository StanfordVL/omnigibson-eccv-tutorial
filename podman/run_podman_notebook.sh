if [ ! -v OMNIGIBSON_DATA_PATH ]; then
  echo "OMNIGIBSON_DATA_PATH is not set. Please point to a folder containing ig_dataset and assets."
  exit
fi

OMNIGIBSON_DATASET_VERSION=$OMNIGIBSON_DATA_PATH/ig_dataset/VERSION
if [ ! -f "$OMNIGIBSON_DATASET_VERSION" ]; then
    echo "ig_dataset not found at $OMNIGIBSON_DATA_PATH/ig_dataset. Please download."
fi

OMNIGIBSON_ASSETS_FILE=$OMNIGIBSON_DATA_PATH/assets/models/tiago/tiago_single.urdf
if [ ! -f "$OMNIGIBSON_ASSETS_FILE" ]; then
    echo "assets not found at $OMNIGIBSON_DATA_PATH/assets. Please download."
fi

# To run with GUI: edit macros.py and add -v /tmp/.X11-unix:/tmp/.X11-unix to container launch command
podman run \
    -e DISPLAY \
    --security-opt=label=disable \
    -v $OMNIGIBSON_DATA_PATH:/iGibson3/igibson/data \
    --network=host --rm -it omnigibson bash -c "source /isaac-sim/setup_conda_env.sh && /isaac-sim/vulkan_check.sh && jupyter lab --allow-root"
