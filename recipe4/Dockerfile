FROM python:3.6
ENV PYTHONUNBUFFERED 1

ARG user=docker

# setup
RUN apt-get update
RUN apt-get install sudo
RUN apt-get install nano
RUN apt-get install make
RUN pip install --upgrade pip
RUN pip install pip-tools

# change working directory
WORKDIR /code

# user
RUN useradd -ms /bin/bash $user
RUN echo "$user:$user" | chpasswd
RUN usermod -G sudo $user
USER $user
