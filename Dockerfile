FROM python:3.10-slim-bookworm

RUN apt-get update && \
    apt-get install -y git gcc python3-dev build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r /requirements.txt

WORKDIR /VJ-Forward-Bot
COPY . /VJ-Forward-Bot
RUN if [ -f /VJ-Forward-Bot/start.sh ]; then chmod +x /VJ-Forward-Bot/start.sh; fi
CMD ["python3", "main.py"]
