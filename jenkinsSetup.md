# Jenkins Set Up

## Install Jenkins and dependencies

Install Jenkins on new EC2 Ubuntu 18 box:

```bash
sudo apt-get update
sudo apt install -y default-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins
sudo   cat /var/lib/jenkins/secrets/initialAdminPassword
wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64
sudo chmod +x /bin/hadolint
sudo apt-get install build-essential
apt install python-pip
sudo apt install python-pip
pylint
sudo apt install pylint
docker
sudo apt  install docker.io
sudo usermod -a -G docker jenkins
sudo service jenkins restart
```

## Plugins

Install the following plugins:

- Amazon ECR
- Blue Ocean
- Blue Ocean Executor Info
- Blue Ocean Pipeline Editor
- Cloudbees AWS Credentials
- Config API for Blue Ocean
- Display URL for Blue Ocean
- Docker
- Events API for Blue Ocean
- Git Pipeline for Blue Ocean
- GitHub Pipeline for Blue Ocean
- Pipeline: AWS Steps
- Pipeline implementation for Blue Ocean

## Further Jenkins set up

After the above add the aws credentials to jenkins credential store and connect to source control.
