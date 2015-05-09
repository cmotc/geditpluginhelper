#! /bin/sh
GPH="geditphelper.sh"
PATH=${pwd}$GPH
chmod a+x $PATH
G=".geditphelper"
sudo ln -s $PATH$G
sudo ln -s $PATH /usr/local/bin/geditphelper