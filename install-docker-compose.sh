set -e

echo "Installing docker"
sudo yum install docker

echo "Adding permissions"
sudo usermod -a -G docker ec2-user

echo "Installing docker-compose"
sudo wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)

sudo chmod +x /usr/local/bin/docker-compose

docker-compose version

echo "done"
