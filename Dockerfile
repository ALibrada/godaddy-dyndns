FROM lispmeister/rpi-python3
MAINTAINER Antonio Librada

# Install dependencies
RUN apt-get update && apt-get install -y \
    git && \
    rm -rf /var/lib/apt/lists/*

# Define working directory
WORKDIR /data
COPY ./godaddy-dyndns.py /data
COPY ./godaddy-dyndns.sh /data

# Define default command
CMD ["/data/godaddy-dyndns.sh"]
