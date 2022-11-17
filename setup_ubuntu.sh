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
conda install -c conda-forge cudatoolkit=11.2 cudnn=8.1.0
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/' > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
pip install --upgrade pip
pip install tensorflow
pip install nvidia-pyindex
pip install --upgrade nvidia-tensorrt

echo "" >> ~/.bashrc
echo "export TF_CPP_MIN_LOG_LEVEL=2 " >> ~/.bashrc

conda deactivate

# python3 -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
# python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"


#
# PyTorch
#
conda create --name pt python=3.10
conda activate pt
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/' > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia

conda deactivate

# python3 -c "import torch; print(torch.cuda.is_available())"


#
# ROS
#
# humble
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt install ros-humble-desktop

conda create --name ros python=3.10
conda activate ros
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo 'source /opt/ros/humble/setup.bash' >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
pip3 install catkin_pkg
# echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/' >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh


# source /opt/ros/humble/setup.bash