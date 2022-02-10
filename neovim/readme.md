## Prerequisites

1. Install python support for neovim: `pip3 install pynvim`
2. Install neovim: https://github.com/neovim/neovim/wiki/Installing-Neovim
3. Install vim-plug: https://github.com/junegunn/vim-plug#installation
4. Install nerd-fonts: https://github.com/ryanoasis/nerd-fonts#font-installation

## Installation

1. Make sure you meet the prerequisites above ^
2. Download the [config file](https://raw.githubusercontent.com/plentiform/go-ide/master/init.vim): 
```
cd ~/Downloads/; wget https://raw.githubusercontent.com/plentiform/go-ide/master/init.vim
```
or
```
cd ~/Downloads/; curl -o init.vim https://raw.githubusercontent.com/plentiform/go-ide/master/init.vim
```
3. Make the configuration directory if it doesn't already exist: `mkdir -p ~/.config/nvim`
4. Move the downloaded file to the correct location: `mv ~/Downloads/init.vim ~/.config/nvim/.`
5. Edit the new configuration file: `nvim ~/.config/nvim/init.vim`
6. If the plugins didn't automatically install, press colon `:` then type `PlugInstall` and press <kbd>Enter</kbd>


reference: https://github.com/plentiform/go-ide
