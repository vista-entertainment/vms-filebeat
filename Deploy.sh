#!/usr/bin/env bash

echo "Filebeats install and create serviced entry"
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.0.0-amd64.deb
sudo dpkg -i filebeat-7.0.0-amd64.deb
sudo filebeat modules enable haproxy