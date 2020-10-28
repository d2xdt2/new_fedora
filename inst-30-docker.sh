dnf -y install docker docker-compose
systemctl start docker
systemctl stop docker
echo '{"graph": "/home/docker"}' > /etc/docker/daemon.json
systemctl start docker
systemctl enable docker

