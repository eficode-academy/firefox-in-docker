FROM python:3.10-slim

# make sure apt doesn't sit and wait for input
ENV DEBIAN_FRONTEND=noninteractive

COPY requirements.txt /requirements.txt

WORKDIR /

RUN apt-get update && \
    apt-get install -y build-essential firefox-esr xpra libpci3 python3-uinput python3-avahi && \
    pip install --no-cache-dir -r requirements.txt && \
    rm /requirements.txt && \
    apt-get remove -y --purge build-essential && \
    apt-get autoremove -y && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

EXPOSE 10000

ENTRYPOINT ["xpra", "start", "--daemon=no", "--start=firefox", "--bind-tcp=0.0.0.0:10000"]
