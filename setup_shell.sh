#!/bin/bash

echo "Installing git, wget, zsh, and vim.";
sudo apt install -y git wget zsh vim;

echo "Changing shell to zsh.";
chsh -s `which zsh`;

echo "Installing Powerline Fonts.";
git clone https://github.com/powerline/fonts.git /tmp/fonts;
/tmp/fonts/install.sh;
rm -rf /tmp/fonts;

echo "Installing Oh-My-Zsh.";
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)";

echo "Setting Oh-My-Zsh Theme.";
sed -i 's/ZSH_THEME=\".*\"/ZSH_THEME=\"agnoster\"/g' ~/.zshrc;

echo "Appending other ~/.zshrc options.";
echo "" >> ~/.zshrc;
echo "export EDITOR=vi" >> ~/.zshrc
echo "export DEFAULT_USER=$(whoami)" >> ~/.zshrc;

echo "Complete.";
echo "";
echo "To make the terminal prompt line up perfectly, set your";
echo "terminal font to Inconsolata for Powerline - Medium - 14.";
echo "";
