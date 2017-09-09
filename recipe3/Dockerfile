FROM python:3
ENV PYTHONUNBUFFERED 1

ARG user=docker

# setup
RUN apt-get update
RUN apt-get install sudo

# user
RUN useradd -ms /bin/bash $user
RUN echo "$user:$user" | chpasswd
RUN usermod -G sudo $user
USER $user
