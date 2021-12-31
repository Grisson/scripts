#! /bin/bash

sudo apt-get install fonts-powerline tmux -y

# install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp vimrc ~/.vimrc
# run the plug install command
vim +PlugInstall +qa

echo "colorscheme gruvbox" >> ~/.vimrc

# install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

# install tmux
curl -fLo ~/.tmux.conf https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf
cp tmux.conf.local ~/.tmux.conf.local

# start tmux default
echo "" >> ~/.bashrc
cat ./start_tmux.sh >> ~/.bashrc