curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

~/.bash_it/install --slient

car >> ~/.bashrc
cat "[[ $TERM != "screen" ]] && exec tmux" >> ~/.bashrc

cp ./vimrc ~/.vimrc
