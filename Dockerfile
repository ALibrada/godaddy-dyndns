FROM lispmeister/rpi-python3
MAINTAINER Antonio Librada

# Install dependencies
RUN apt-get update && apt-get install -y \
    git cron && \
    rm -rf /var/lib/apt/lists/*

# Define working directory
WORKDIR /data
COPY ./godaddy-dyndns.py /data
COPY ./godaddy-dyndns.sh /data

# Import crontab file
ADD ./crontab /etc/crontab

# Define default command
CMD cron -f
