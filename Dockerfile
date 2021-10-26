# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
#ARG BASE_CONTAINER=ucsdets/datahub-base-notebook:2021.2-stable

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
ARG BASE_CONTAINER=ucsdets/datascience-notebook:2021.2-stable

# scipy/machine learning (tensorflow, pytorch)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
#ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2021.3-42158c8

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

#run sudo apt install docker.io
#RUN sudo apt-get install -y aria2 nmap traceroute
Run sudo apt-get update -y
# Run sudo apt-get install \
#     ca-certificates \
#     curl \
#     gnupg \
#     lsb-release
# Run curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
Run sudo apt-get install -y aria2
Run sudo apt-get install -y nmap
Run sudo apt-get install -y traceroute

# 3) install packages using notebook user
USER jovyan

# RUN conda install -y scikit-learn

RUN pip install --no-cache-dir geopandas babypandas

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
