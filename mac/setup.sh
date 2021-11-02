#! /bin/zsh

# have xcode command line tool installed
#	xcode-select --install
# have brew installed
# 	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 2> /dev/null

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# change zsh theme
cp zshrc ~/.zshrc

# install vim plug
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp vimrc ~/.vimrc
# run the plug install command
vim +PluginInstall +qall

# install tmux
brew install tmux
curl -fLo ~/.tmux.conf https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp tmux.conf.local ~/.tmux.conf.local