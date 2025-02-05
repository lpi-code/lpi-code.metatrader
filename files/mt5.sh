#!/bin/bash
set -x

export WINEPREFIX=$HOME/.mt5_$1




# Set environment to Windows 10
WINEPREFIX=$WINEPREFIX winecfg -v=win10
# Install WebView2 Runtime
WINEPREFIX=$WINEPREFIX DISPLAY=:99.0 wine /tmp/MicrosoftEdgeWebview2Setup.exe /silent /install
# Start MetaTrader installer
WINEPREFIX=$WINEPREFIX DISPLAY=:99.0 XDG_RUNTIME_DIR=$WINEPREFIX wine /tmp/mt5setup.exe /auto

# Move Desktop shortcuts
cd $HOME/Desktop
mv 'MetaEditor 5.desktop' "MetaEditor 5 - $1.desktop"
mv 'MetaTrader 5.desktop' "MetaTrader 5 - $1.desktop"
