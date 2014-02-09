#!/bin/sh

# Configure as needed:
#     MASTER_CONTROL
#     STEP
#
# Interface: All defined function names
#

# User's Settings
MASTER_CONTROL="Master"
STEP=3


# Script's Settings
STATE_FILE="/tmp/volume.state"


getMasterVolume () {
    amixer -D pulse sget $MASTER_CONTROL|tail -n1|sed -r 's/.*\[(.*)%\].*/\1/'
}

# $1: New Volume Level in %
setMasterVolume () {
    amixer -D pulse sset $MASTER_CONTROL $1"%">/dev/null;
}

volumeUp () {
    amixer -D pulse sset Master $STEP%+>/dev/null;
}

volumeDown () {
    amixer -D pulse sset Master $STEP%->/dev/null;
}

mute () {
    echo $(getMasterVolume) > $STATE_FILE;setMasterVolume 0;
    notify-send -t 1000 -i /usr/share/icons/gnome/48x48/devices/audio-headphones.png "Volume" "Muted."
}

unmute () {
    setMasterVolume $(cat $STATE_FILE);rm -f $STATE_FILE;
    osd;
}


# Main Interface
up () {
    volumeUp;
    osd;
}

down () {
    volumeDown;
    osd;
}

togglemute () {
    if [ -f "${STATE_FILE}" ]; then
        unmute;
    else
        mute;
    fi
}

get () {
    getMasterVolume;
}

osd () {
    BODY="Current Volume Level: "$(getMasterVolume)"%"
    notify-send -t 1000 -i /usr/share/icons/gnome/48x48/devices/audio-headphones.png "Volume" "${BODY}"
}


# This do the interface magic (thanks Bash ;-))
$@
