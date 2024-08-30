# ref: https://docs.docker.com/engine/install/ubuntu/
# This shell script was written for ubuntu 24.04, 
# other versions or distributions have not been tested.
# You should make your own judgement as to whether this script is safe and whether it will cause damage to your system. 
# The script is provided as is and I am not responsible for any problems arising from it.

#!/bin/bash

echo "Please enter your username which you are using for maintenance."
read username

# Add Docker's official GPG key
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install the latest docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Set user group for maintenance user
sudo usermod -aG docker $username

# Running Hello World for test
sudo docker run hello-world
