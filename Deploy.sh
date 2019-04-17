#!/usr/bin/env bash

echo "Filebeats install and create serviced entry"
curl --silent -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.0.0-amd64.deb
sudo dpkg -i filebeat-7.0.0-amd64.deb

#configure filebeats with propietary fields
sudo cp etc/filebeat.yml  /etc/filebeat/filebeat.yml

#configure module with haproxy file route
sudo cp etc/haproxy.yml  /etc/filebeat/modules.d/haproxy.yml
sudo filebeat modules enable haproxy

#TODO create systemd service
echo "Create systemd configuration... "
if [ ! -f /etc/systemd/system/filebeat.service ]; then
    echo "filebeat service File not found!"
	sudo cp systemd/filebeat.service /etc/systemd/system/filebeat.service
	sudo systemctl daemon-reload
	sudo systemctl enable filebeat
else
    echo "filebeat service File already present"
fi

#The unit file, source configuration file or drop-ins of filebeat.service changed on disk
#(re)start filebeat
sudo systemctl start filebeat

sudo systemctl status filebeat