FROM python:3
ENV PYTHONUNBUFFERED 1

# dependencies
RUN apt-get update
RUN apt-get install nano
RUN apt-get install make
RUN pip install --upgrade pip
RUN pip install pip-tools
WORKDIR /code
