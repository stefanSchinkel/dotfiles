# Readme

This describes _my_ setting up on Ubuntu/Debian. Works for me. Your milage may vary.

[TOC]

## Install needed pkgs

:exclamation: Make sure to check/understand before pasting blindly :exclamation:

### from repo
```sh
# refresh repos in case you didn't before
# sudo apt-get update &&  sudo apt-get upgrade

# basics needed for developement
sudo apt-get install git make build-essential zsh vim tmux plocate wget curl mc meld
# I prefer to have poetry system-wide
sudo apt-get install python3-poetry
# and some extras (if you need and use gnome that is)
sudo apt-get install nextcloud-desktop keepassxc gnome-tweaks gnome-sushi guake chromium-browser

# and all the fancy search/fuzzy finders
sudo apt-get install silversearcher-ag fzf ripgrep goaccess
```
### from snap (optional)
```sh
sudo snap install freetube postman spotify firefox
```
## get dotfiles
Only now clone repo (git is needed)
```sh
git clone https://github.com/stefanSchinkel/dotfiles.git ~/.dotfiles
```

## link dotfiles
```sh
ln -s .dotfiles/zshrc ~/.zshrc
ln -s .dotfiles/vimrc ~/.vimrc
ln -s .dotfiles/tmux.conf ~/.tmux.conf
```
## UFW

First things first, shut down incoming traffic.
```sh
sudo ufw enable
# and check w/
sudo ufw status
```

## ZSH
### install zsh
ohmyzsh more precisely

```sh
# run Deppeninstaller
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
### make zsh default
This is not needed if you set up zsh via the above wget
```sh
# OR make it default if installed already
sudo chsh -s $(which zsh) $USER
```
### get p10
Details here: https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh
```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
the .zshrc in the repo already has p10k set as default theme

### setup fonts for p10k
```sh
cd ~/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
# either manually install w/ Fonts or do this
# cp to /usr/local/share/fonts and run sudo fc-cache -fv to update fonts cache
# cp MesloGS ~/.local/share/fonts/
# sudo fc-cache -fv
# AFTER that:
# set terminal to use fonts and run
p10k configure
```

## TMUX
The tmux setup is fairly simple, but it needs tpm, so we get that:
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## VIM
### vim for GIT
First things first. Ditch nano for commit msgs.

```
git config --global core.editor vim
```
### plugin manager
For the vimrc here, vundle is used as a plugin manager. So this needs to be cloned too:
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### colorscheme
For the .vimrc to work, you'll need zenburn. Here's how to get it.
```sh
# get scheme
wget https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim -O ~/.vim/colors/zenburn.vim
# link
ln -s ~/.vim/colors/zenburn.vim ~/.vim/bundle/Zenburn/colors/zenburn.vim
```
#### Note on black
The vimrc defines :Black to run on save (for python). Therefore make sure to have it installed in the venv you use when firing up vim or have installed systemwide. Otherwise vim will complain when you start editing Python code.

Also, you'll of course have to run :PluginInstall once.

#### Note on MarkdownPreview
For me MarkdownPreview occassionally fails. But there is a fix/issue for that see: https://github.com/iamcco/markdown-preview.nvim/issues/7

## Neovim
### Install nvm
For neovim we use pyright, which is easiest to run in node. Since Ubuntu ships w/ a dated version of node, we install nvm to get a more recent version.
```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```
The .zsh already is nvm aware but you'll have to `source ~/.zshrc` after installing it. Once done, pick a recent version of node eg.
```shell
nvm install v20.13.1
```
once it's installed, install pyright with
```
npm install -g pyright
```
### Neovim Kickstart
For a head start nice projects to configure neovim exist such as [Neovim Kickstart](https://github.com/nvim-lua/kickstart.nvim). You can just clone that or use mine:

```sh
git clone
git clone git@github.com:stefanSchinkel/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
# or the https version
# git clone https://github.com/stefanSchinkel/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```
Since the neovim kickstart aims for really new versions, we'll also install neovim from ppa.
```sh
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim
```
## VSCodium
It's nice to have a GUI based editor too. Especially for the debugger.

```sh
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
 sudo apt update && sudo apt install codium

```
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

## kubernetes
### kubectl

We also need some tooling to manage k3s cluster. Those are only the mgmt tools - the cluter is supposed to be running somewhere else.

```sh
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
url -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list...# helps tools such as command-not-found to work correctly
sudo apt-get update
sudo apt-get install -y kubectl
```

This will intall the kubectl tooling. The zshrc already includes the kubectl plugins so quite some typing can be saved.
### kubeseal
For working w/ shared secrets we need `kubeseal`.
```sh
export KUBESEAL_VERSION='0.26.3' # latest as of 06/24
curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION:?}/kubeseal-${KUBESEAL_VERSION:?}-linux-amd64.tar.gz"
tar -xvzf kubeseal-${KUBESEAL_VERSION:?}-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
```
### flux
For gitops we also need flux. Available via Deppeninstaller
```sh
curl -s https://fluxcd.io/install.sh | sudo bash
```
The .zshrc already has completion for flux set up.

## Pyenv
I (still) use pyenv, just because it works for me. Also the .zshrc already is aware the pyenv is being used. If it's not installed that my cause issues.

```sh
# install deps, some may already be there
sudo apt install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
# and once more a Deppeninstaller
curl https://pyenv.run | bash
```
Test if it works by installing eg the latest 3.10 and creating a playground env.
Feel free to use any other version of choice.

```sh
pyenv install 3.10.13
pyenv virtualenv 3.10.13 playground
pyenv activate playground
# you can also set the global python version once you're at it:
#pyenv global 3.10.13
```
## Rust
Rust is straighforward (of course with a Deppeninstaller). We install it after docker though, just to make sure that we can support multiarch builds

```sh
# install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# check
cargo -h
```
### Multiarch support/cross platform compilation
```sh
cargo install -f cross
```
That's basically all needed. For verification use sth like this
```sh
# create a new dummy project
cargo new hello-world
cd hello-world
cargo run   # just to see if toolchain works on native arch
cross build --target --target=armv7-unknown-linux-musleabihf  # or any arch of your choice
#
```
On first run it will get the build env as a docker image. Might take a bit.

    Unable to find image 'ghcr.io/cross-rs/armv7-unknown-linux-musleabihf:0.2.5' locally
    0.2.5: Pulling from cross-rs/armv7-unknown-linux-musleabihf
    b549f31133a9: Pull complete
    19d48abface2: Pull complete
    ...
    Compiling hello-world v0.1.0 (/project)
    Finished dev [unoptimized + debuginfo] target(s) in 0.28s


Before running it on a different machine, check what we build:
```sh
file target/armv7-unknown-linux-musleabihf/debug/hello-world
# target/armv7-unknown-linux-musleabihf/debug/hello-world: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, with debug_info, not stripped
```

After it's build you can just scp/rsync it to your target (eg. a raspberry) and check if it works
```sh
scp target/armv7-unknown-linux-musleabihf/debug/hello-world pi@raspberrypi.local # or however the Pi is called
ssh pi@raspberrypi.local
# pi@raspberrypi.local>./hello-world
# Hello, world!
# pi@raspberrypi.local>
`
