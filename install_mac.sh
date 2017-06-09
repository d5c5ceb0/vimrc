#!/bin/bash

cp ./vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim ~/.vimrc +PluginInstall +qa
git clone https://github.com/powerline/fonts.git ~/.vim/fonts
cd ~/.vim/fonts
chmod 777 install.sh
./install.sh
brew install ctags
brew install cscope
