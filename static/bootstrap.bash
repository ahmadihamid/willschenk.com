#!/bin/bash

function check() {
  if command -v $1 > /dev/null; then
    $2
  else
    return 1
  fi
}

function apt_install() {
  echo Installing $@
  sudo apt-get install -y $@
}

function install_ipfs() {
  echo
  echo "Installing ipfs"
  cd /tmp
  wget https://dist.ipfs.io/go-ipfs/v0.4.15/go-ipfs_v0.4.15_linux-amd64.tar.gz
  tar xzvf go-ipfs_v0.4.15_linux-amd64.tar.gz
  cd go-ipfs
  sudo ./install.sh
}

function install_docker() {
  echo
  echo "Installing Docker"
  # Update debian
  sudo apt-get update
  sudo apt-get upgrade

  sudo apt-get install \
       apt-transport-https \
       ca-certificates \
       curl \
       gnupg2 \
       software-properties-common

  # Add the gpg key if it;s not there
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

  # Add the docker repository
  sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/debian \
     $(lsb_release -cs) \
     stable"

  # Update and add docker-ce
  sudo apt-get update
  sudo apt-get install docker-ce

  # Install docker-compose
  sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose

  # Add yourself to the docker group if you aren't already
  sudo groupadd docker
  sudo usermod -aG docker $USER
}

function install_atom() {
  echo
  echo Installing atom
  cd /tmp
  sudo apt-get install wget
  wget https://atom.io/download/deb
  mv deb atom.deb
  sudo apt install ./atom.deb
}

function install_nvm() {
  echo
  echo Installing NVM
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
  source ~/.profile
  nvm install 10
  nvm global 10
}

function install_node() {
  echo
  echo Install node
  echo Not yet
}

function install_rbenv() {
  echo
  echo Installing rbenv

  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
  echo 'export PATH=$PATH:$HOME/.rbenv/bin' >> $HOME/.profile
  echo 'eval "$(rbenv init -)"' >> $HOME/.profile
  source ~/.profile
  rbenv install 2.5.5
  rbenv global 2.5.5
}

function install_go() {
  echo
  echo Installing go
  cd /tmp
  wget https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf go1.12.1.linux-amd64.tar.gz
  echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> $HOME/.profile
  source ~/.profile
}

function install_hugo() {
  echo
  echo Installing hugo
  cd /tmp
  git clone https://github.com/gohugoio/hugo.git
  cd hugo
  go install
}

function install_heroku() {
  echo
  echo Installing heroku
  curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
}

function install_gcloud() {
  # Create environment variable for correct distribution
  export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

  # Add the Cloud SDK distribution URI as a package source
  echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

  # Import the Google Cloud Platform public key
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

  # Update the package list and install the Cloud SDK
  sudo apt-get update && sudo apt-get install google-cloud-sdk
}

check "wget" "echo wget found" || apt_install "wget"
check "ipfs" "ipfs version" || install_ipfs
check "docker" "docker -v" || install_docker
check "atom" "atom --version | head -1" || install_atom
# check "nvm" "nvm --version" || install_nvm
check "node" "node -v" || install_node
check "rbenv" "rbenv --version" || install_rbenv
check "go" "go version" || install_go
check "hugo" "hugo version" || install_hugo
check "heroku" "heroku version" || install_heroku
check "gcloud" "echo gcloud found" || install_gcloud
exit

```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```