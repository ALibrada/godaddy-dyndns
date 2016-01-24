#!/usr/bin/env python3
import os
import logging
import sys

import pif
import pygodaddy


logging.basicConfig(filename='godaddy.log',
		    format='%(asctime)s %(message)s',
		    level=logging.INFO)

client = pygodaddy.GoDaddyClient()
is_logged_in = client.login(os.environ.get('GODADDY_USERNAME'),
			                os.environ.get('GODADDY_PASSWORD'))
if not is_logged_in:
    logging.error('Login failed!')
    sys.exit(1)

for domain in client.find_domains():
    dns_records = list(client.find_dns_records(domain))
    public_ip = pif.get_public_ip()
    logging.info("Domain '{0}' DNS records: {1}".format(domain, dns_records))
    if public_ip != dns_records[0].value:
        client.update_dns_record(domain, public_ip)
        logging.info("Domain '{0}' public IP set to '{1}'".format(domain, public_ip))
