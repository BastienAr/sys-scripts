#!/usr/bin/env bash

function update() {
  echo "------------------------------------------"
  echo "Updating..."
  apt update -y
  apt upgrade -y
}

function installCommonTools() {
  echo "------------------------------------------"
  echo "Installing commons tools..."
  apt install -y curl \
                 wget \
                 git \
                 ca-certificates
}

function zsh() {
  echo "------------------------------------------"
  echo "Installing zsh..."
  apt install -y zsh
  echo "------------------------------------------"
  echo "Configuring zsh..."
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  wget -O ~/.zshrc https://raw.githubusercontent.com/BastienAr/sys-scripts/master/.zshrc
}

function kvm() {
  echo "------------------------------------------"
  echo "Installing kvm..."
  apt install -y nginx
  wget -O /tmp/kimchi.deb https://github.com/kimchi-project/kimchi/releases/download/2.5.0/kimchi-2.5.0-0.noarch.deb
  wget -O /tmp/wok.deb https://github.com/kimchi-project/kimchi/releases/download/2.5.0/wok-2.5.0-0.noarch.deb
  dpkg -i /tmp/wok.deb /tmp/kimchi.deb
  apt install -yf
  mkdir -p /home/kvm/{images,isos}
}

# Main
update
installCommonTools
zsh
kvm