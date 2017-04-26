#!/bin/bash

echo "Setting Oh-My-Zsh Theme.";
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k ;
sed -i 's/ZSH_THEME=\".*\"/ZSH_THEME=\"powerlevel9k\/powerlevel9k\"/g' ~/.zshrc ;

echo "Prepending TERM setting to ~/.zshrc";
echo "export TERM=\"xterm-256color\"" | cat - ~/.zshrc > temp && mv temp ~/.zshrc

echo "Appending other ~/.zshrc options.";
echo "" >> ~/.zshrc;
echo "export EDITOR=vi" >> ~/.zshrc;
echo "export DEFAULT_USER=$(whoami)" >> ~/.zshrc;

echo "Complete.";
echo "";
echo "To make the terminal prompt line up perfectly, set your";
echo "terminal font to Inconsolata for Powerline - Medium - 14.";
echo "";
