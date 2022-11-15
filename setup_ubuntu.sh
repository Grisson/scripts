#! /bin/bash

#
# Apt repo
#
# add sublime text repo
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

#
# App
#
# install basic apps
sudo apt update
sudo apt-get install -y fonts-powerline tmux vim curl git sublime-text python3 python-is-python3 python3-pip

#
# Vim plug
#
# install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp vimrc ~/.vimrc
# run the plug install command
vim +PlugInstall +qa
# change color scheme
echo "colorscheme gruvbox" >> ~/.vimrc

#
# bash-it
#
# install
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
# change theme
sed -i 's/bobby/modern/i' .bashrc

#
# Tmux
#
# install some tmux custom configuration
curl -fLo ~/.tmux.conf https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf
curl -fLo ~/.tmux.conf.local https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf.local
# start tmux default
echo "" >> ~/.bashrc
cat ./start_tmux.sh >> ~/.bashrc


#
# Conda
#
# install
curl -fLo miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh
chmod +x miniconda.sh
./miniconda.sh -b -f
# source <path to conda>/bin/activat
conda config --set auto_activate_base false


#
# Tensorflow
#
conda create --name tf python=3.10
conda activate tf