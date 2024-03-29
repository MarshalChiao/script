#!/bin/bash
sudo pacman-mirrors -c China

# add archlinuxcn
echo '

Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' | sudo  tee -a  /etc/pacman.d/mirrorlist

sudo pacman -Sc --noconfirm
sudo pacman -Syyu --noconfirm
# update GPG keys
sudo pacman -S --noconfirm archlinuxcn-keyring
sudo pacman -S --noconfirm net-tools
sudo pacman -S --noconfirm the_silver_searcher
sudo pacman -S --noconfirm emacs
sudo pacman -S --noconfirm ack
sudo pacman -S --noconfirm openssh
sudo pacman -S --noconfirm lsb-release
sudo pacman -S --noconfirm net-tools
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm make
sudo pacman -S --noconfirm gcc
sudo pacman -S --noconfirm cmake
sudo pacman -S --noconfirm clang
sudo pacman -S --noconfirm libtool
sudo pacman -S --noconfirm unzip
sudo pacman -S --noconfirm unrar
sudo pacman -S --noconfirm mercurial
sudo pacman -S --noconfirm binutils
sudo pacman -S --noconfirm bison
sudo pacman -S --noconfirm ca-certificates
sudo pacman -S --noconfirm sysstat
sudo pacman -S --noconfirm nmon
sudo pacman -S --noconfirm htop
sudo pacman -S --noconfirm atop
sudo pacman -S --noconfirm iotop
sudo pacman -S --noconfirm iftop
# dig command
sudo pacman -S --noconfirm bind
sudo pacman -S --noconfirm nethogs
sudo pacman -S --noconfirm ethtool
sudo pacman -S --noconfirm dstat
sudo pacman -S --noconfirm vnstat
sudo pacman -S --noconfirm strace
sudo pacman -S --noconfirm colordiff
sudo pacman -S --noconfirm tmux
sudo pacman -S --noconfirm fzf
sudo pacman -S --noconfirm nvm
sudo pacman -S --noconfirm vim
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm telegram-desktop
# screen shot
sudo pacman -S --noconfirm flameshot
# screen recording
sudo pacman -S --noconfirm simplescreenrecorder
sudo pacman -S --noconfirm tree
sudo pacman -S --noconfirm i3
sudo pacman -S --noconfirm fcitx
sudo pacman -S --noconfirm jq
sudo pacman -S --noconfirm exfat-utils
sudo pacman -S --noconfirm zsh
sudo pacman -S --noconfirm base-devel
sudo pacman -S --noconfirm the_silver_searcher
sudo pacman -S --noconfirm autojump
# install wps
sudo pacman -S --noconfirm wps-office
sudo pacman -S --noconfirm ttf-wps-fonts
# VS Code 编辑器
sudo pacman -S --noconfirm visual-studio-code-bin
# PostMan
sudo pacman -S --noconfirm postman-bin

# if installed yay, you can
yay -S --noconfirm google-chrome

# install google-chrome
if [ ! -d $HOME/google-chrome  ]; then
    cd $HOME
    git clone https://aur.archlinux.org/google-chrome.git/
    cd google-chrome
    makepkg -s
    sudo pacman -U --noconfirm google-chrome*.pgk.tar.gz
fi

# install sogoupinyin
if [ ! -f $HOME/.xprofile ]; then
    sudo pacman -S --noconfirm fcitx-im
    sudo pacman -S --noconfirm fcitx-configtool
    sudo pacman -S --noconfirm fcitx-sogoupinyin

echo "

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=\"@im=fcitx\"" > ~/.xprofile

fi

# install oh-my-zsh
# sudo pacman -S --noconfirm oh-my-zsh
# https://github.com/ohmyzsh/ohmyzsh
if [ ! -d $HOME/.oh-my-zsh ]; then
  echo -e "\nInstalling oh-my-zsh..."
  curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
  sh install.sh
  sudo chsh -s /bin/zsh
fi

# install maven
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/
makepkg -s
sudo pacman -U visual-studio-code-bin-*.pkg.tar.xz
cd ../ && sudo rm -rfv visual-studio-code-bin/



echo 'please reboot!'
