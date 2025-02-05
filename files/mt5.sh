#!/bin/bash
set -x

export WINEPREFIX=$HOME/.mt5_$1


unset DISPLAY
unset XAUTHORITY
unset XDG_RUNTIME_DIR


# Set environment to Windows 10
env -i WINEPREFIX=$WINEPREFIX winecfg -v=win10 
# Install WebView2 Runtime
export DISPLAY=:99.0

WINEPREFIX=$WINEPREFIX DISPLAY=$DISPLAY wine /tmp/MicrosoftEdgeWebview2Setup.exe /silent /install
# Start MetaTrader installer
WINEPREFIX=$WINEPREFIX XDG_RUNTIME_DIR=$WINEPREFIX DISPLAY=$DISPLAY wine /tmp/mt5setup.exe /auto

# Move Desktop shortcuts
cd $HOME/Desktop
mv 'MetaEditor 5.desktop' "MetaEditor 5 - $1.desktop"
mv 'MetaTrader 5.desktop' "MetaTrader 5 - $1.desktop"
