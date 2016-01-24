FROM lispmeister/rpi-python3
MAINTAINER Antonio Librada

# Install dependencies
RUN apt-get update && apt-get install -y \
    git && \
    rm -rf /var/lib/apt/lists/*

# Define working directory
WORKDIR /data

# Define default command
CMD ["godaddy-dyndns.sh"]
