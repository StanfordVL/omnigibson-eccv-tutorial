FROM nvcr.io/nvidia/isaac-sim:2022.1.1

RUN apt-get update && apt-get install -y \
  curl \
  git \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN curl https://storage.googleapis.com/gibson_scenes/og_dataset_lite.tar.gz | tar -xz
ENV IGIBSON_DATASET_PATH /og_dataset

RUN curl https://storage.googleapis.com/gibson_scenes/og_assets.tar.gz | tar -xz
ENV GIBSON_ASSETS_PATH /assets

RUN echo "bash /isaac-sim/vulkan_check.sh" >> /root/.bashrc
RUN rm -rf /isaac-sim/exts/omni.isaac.ml_archive/pip_prebundle/gym

RUN  curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj -C / bin/micromamba

ENV MAMBA_ROOT_PREFIX /micromamba
RUN micromamba create -n igibson -c conda-forge python=3.7
RUN micromamba shell init --shell=bash --prefix=/micromamba
ENV PATH /micromamba/envs/igibson/bin:$PATH
RUN echo "source /isaac-sim/setup_conda_env.sh" >> /root/.bashrc

WORKDIR / 
RUN curl https://storage.googleapis.com/gibson_scenes/omnigibson.tar.gz | tar -xz
RUN curl https://storage.googleapis.com/gibson_scenes/bddl.tar.gz | tar -xz

RUN mkdir -p /OmniGibson/omnigibson/data
WORKDIR /OmniGibson/omnigibson/data
RUN curl https://storage.googleapis.com/gibson_scenes/omnigibson.key > omnigibson.key

WORKDIR /OmniGibson
RUN pip install -e .
RUN micromamba install -n igibson -c conda-forge opencv

WORKDIR /bddl-dev
RUN pip install -e .

WORKDIR /OmniGibson/omnigibson/examples/

RUN sed -i "s/gm.HEADLESS = False/gm.HEADLESS = True/" /OmniGibson/omnigibson/macros.py

RUN pip install jupyterlab

COPY tutorial.ipynb /OmniGibson/omnigibson/examples/tutorial.ipynb

ENTRYPOINT []

CMD ["/bin/bash"]
