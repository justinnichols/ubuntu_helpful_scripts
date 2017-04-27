#!/bin/bash
echo "";
echo "Moving window controls to the left...";
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:';
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/DecorationLayout':<'close,minimize,maximize:'>}";
echo "Complete.";
echo "";
