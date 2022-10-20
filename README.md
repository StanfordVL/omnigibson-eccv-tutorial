# Requirements

- Modern Linux distribution (Ubuntu 20.04, Fedora 36, etc.)
- RTX capable Nvidia graphics card (20 series or newer,)
- Up-to-date nvidia drivers
- A container runtime (docker, podman, enroot)
  - For docker: nvidia-docker2
  - For podman: nvidia-container-toolkit

# Usage

1. Build the container
```
bash build_docker.sh
```

2. To get a jupyter notebook
```
bash run_docker_notebook.sh
```

3. To get access to a shell inside the container
```
bash run_docker.sh
```
