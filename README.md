VIM

author: JJG 

Introduction:
-------------
VIM Editor

Objective:
----------
Save my personal editor in a repository in order to get it anytime I need.

References:
-----------
This is my personal configuration, and I use it with Ultimate VIM
vim.spf13.com/

VIM installation with LUA for neocomplete: 
------------------------------------------
  sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common

  sudo apt-get build-dep vim-gnome

  sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev mercurial libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

  sudo rm -rf /usr/local/share/vim

  sudo rm /usr/bin/vim

  sudo mkdir /usr/include/lua5.1/include
  sudo mv /usr/include/lua5.1/*.h /usr/include/lua5.1/include/

  sudo ln -s /usr/bin/luajit-2.0.0-beta9 /usr/bin/luajit

  cd ~
  hg clone https://code.google.com/p/vim/
  cd vim/src
  make distclean
  ./configure --with-features=huge \
  --enable-rubyinterp \
  --enable-largefile \
  --disable-netbeans \
  --enable-pythoninterp \
  --with-python-config-dir=/usr/lib/python2.7/config \
  --enable-perlinterp \
  --enable-luainterp \
  --with-luajit \
  --enable-gui=auto \
  --enable-fail-if-missing \
  --with-lua-prefix=/usr/include/lua5.1 \
  --enable-cscope 
  make 
  sudo make install

  Note:
  -----
  You will need ruby 1.9 for command-t pluggin.
