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

echo "";
echo "Exit back to bash and run setup_shell_02.sh";
