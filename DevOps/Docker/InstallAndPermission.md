# Docker installation on EC2 Ubuntu

### Docker Installation
1. Set up Docker's apt repository
   ```sh 
   # Add Docker official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update                           #Extract tomcat files
   ```
 
2. Install the Docker packages.
   ```sh
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```

3. Change Permission
   ```sh
   #Add Your User to the Docker Group
   sudo usermod -aG docker your_username 

   #Verify Docker Group Membership
   groups your_username 

   #Adjust Docker File Permissions
   sudo chown -R your_username:docker /var/run/docker.sock 
   sudo chmod 660 /var/run/docker.sock 
   ```

4. Restart Docker sevice
   ```sh
   sudo service docker restart 
   ```

5. Verify that the installation is successful
   ```sh
   docker --veriosn
   docker run hello-world
   ```
