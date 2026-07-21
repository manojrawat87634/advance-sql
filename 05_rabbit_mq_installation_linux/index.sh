sudo apt-get update -y
sudo apt-get install -y curl gnupg apt-transport-https

sudo apt-get install -y erlang rabbitmq-server

# For WSL (sysvinit):
sudo service rabbitmq-server start
sudo service rabbitmq-server status

# For standard Linux / Systemd:
# sudo systemctl enable --now rabbitmq-server

sudo rabbitmq-plugins enable rabbitmq_management
sudo service rabbitmq-server restart