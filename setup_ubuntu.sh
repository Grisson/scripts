#! /bin/bash

# install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp vimrc ~/.vimrc
# run the plug install command
vim +PluginInstall +qall

# install tmux
brew install tmux
curl -fLo ~/.tmux.conf https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf
cp tmux.conf.local ~/.tmux.conf.local

# start tmux default
cat ./start_tmux.sh >> .bashrc