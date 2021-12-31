#! /bin/bash

# this script only works on glaptop

gcert

sudo apt install -y fzf youcompleteme

# install fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

# install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

# install tmux
curl -fLo ~/.tmux.conf https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf
cp tmux.conf.local ~/.tmux.conf.local

# start tmux default
echo "" >> ~/.bashrc
cat ./start_tmux.sh >> ~/.bashrc

# cat >> ~/.bashrc << EOF

# if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#   . /etc/bash_completion
# fi

# EOF


# google specific changes

sudo touch /usr/share/com.google.loas/is_corp_machine

sudo apt install -y google-hg srcfs crudd binfs-workstation vim-google-config core-devetools

# install vim Glug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp gvimrc ~/.vimrc
# run the plug install command
vim +PlugInstall +qa

echo "colorscheme primary" >> ~/.vimrc

# install sublime
# https://g3doc.corp.google.com/company/editors/sublime/index.md?cl=head
sudo glinux-add-repo sublime-text stable
sudo apt update
sudo apt install google-sublime-text
echo fs.inotify.max_user_watches=4194304 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# to support vim buganizer
glinux-add-repo bugged
sudo apt update
sudo apt install bugged

# google/bin Binfs
sudo glinux-add-repo binfs stable && sudo apt update && sudo apt install binfs

# google/data
sudo glinux-add-repo google-x20
sudo apt-get update
sudo apt-get install google-x20

sudo glinux-updater