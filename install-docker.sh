set -e

# For ubuntu
# curl -fsSL https://get.docker.com -o get-docker.sh
# sh get-docker.sh


echo "Installing docker"
sudo yum install docker -y

echo "Adding permissions"
sudo usermod -a -G docker ec2-user # Have the script detect the name of the current user

echo "Installing docker-compose"
sudo wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose version

echo "Enabaling docker daemon to start on boot"
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "done"
