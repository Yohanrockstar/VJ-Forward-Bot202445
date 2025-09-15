FROM python:3.10-slim-bookworm

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt
RUN pip3 install -U pip && \
    pip3 install -U -r requirements.txt

WORKDIR /VJ-Forward-Bot

RUN mkdir /VJ-Forward-Bot
COPY . /VJ-Forward-Bot
CMD ["python3", "/VJ-Forward-Bot/main.py"]
