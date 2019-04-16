#!/usr/bin/env bash

echo "Filebeats install and create serviced entry"
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.0.0-amd64.deb
sudo dpkg -i filebeat-7.0.0-amd64.deb
sudo filebeat modules enable haproxy

#TODO create systemd service
echo "Create systemd config "
sudo mv systemd/filebeat.service /etc/systemd/system/filebeat.service
#The unit file, source configuration file or drop-ins of filebeat.service changed on disk
sudo systemctl daemon-reload


sudo systemctl enable filebeat
sudo systemctl status filebeat