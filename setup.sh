#!/bin/sh

# all the installs
sudo apt-get update -y
sudo apt-get install -y git make build-essential zsh vim tmux plocate wget curl mc meld python3-poetry \
nextcloud-desktop keepassxc gnome-tweaks gnome-sushi guake chromium-browser silversearcher-ag fzf ripgrep

# repo and dotfiles`
git clone https://github.com/stefanSchinkel/dotfiles.git ~/.dotfiles
ln -s .dotfiles/zshrc ~/.zshrc
ln -s .dotfiles/vimrc ~/.vimrc
ln -s .dotfiles/tmux.conf ~/.tmux.conf
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cd ~/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
# cp to /usr/local/share/fonts or $USER/.local/share/fonts 
# and run sudo fc-cache -fv to update fonts cache
# AFTER that:
# set terminal to use fonts and run
p10k configure

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git config --global core.editor vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

### colorscheme
wget https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim -O ~/.vim/colors/zenburn.vim
ln -s ~/.vim/colors/zenburn.vim ~/.vim/bundle/Zenburn/colors/zenburn.vim
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

npm install -g pyright

## VSCodium

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main'  | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium

## DBeaver
A decent graphical DB tool for ERM manipulations and fancy visuals
```sh
# we need to add a ppa for that
sudo add-apt-repository ppa:serge-rider/dbeaver-ce
sudo apt-get update
sudo apt-get install dbeaver-ce
```

## Docker
We're installing docker-ce stable from the repos, not .deb

### setup repository incl. GPG key adding
```sh
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

### install docker-ce and friends
```sh
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 # test
 sudo docker run hello-world
 ```
### docker post install
This is needed for docker w/out sudo. To take full effect you'll need to logout/login once. But `newgrp` allow for testing w/out logout.
```sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
```

## Pyenv
I (still) use pyenv, just because it works for me. Also the .zshrc already is aware the pyenv is being used. If it's not installed that my cause issues.

```sh
# install deps, some may already be there
sudo apt install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
# and once more a Deppeninstaller
curl https://pyenv.run | bash

# install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# check
cargo -h
```
### Multiarch support/cross platform compilation
cargo install -f cross
`

