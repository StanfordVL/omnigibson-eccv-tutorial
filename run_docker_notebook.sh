docker run \
    --gpus all \
    --privileged \
    -e DISPLAY \
    --network=host --rm -it omnigibson bash -c "source /isaac-sim/setup_conda_env.sh && /isaac-sim/vulkan_check.sh && jupyter lab --allow-root"
