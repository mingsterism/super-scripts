#!/bin/bash

sudo apt-get update && apt-get upgrade -y
sudo apt-get install python3-pip
sudo pip3 install --upgrade pip
sudo pip3 install numpy matplotlib scipy jupyter pandas
sudo pip3 install -U scikit-learn
sudo pip3 install jupyter_contrib_nbextensions

# Install and Activate jupyter vim bindings
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
chmod -R go-w vim_binding
jupyter nbextension enable vim_binding/vim_binding

#install jupyter themes
sudo pip3 install --upgrade jupyterthemes
jt -t solarizedd -cellw 1300 -lineh 140 -nfs 10