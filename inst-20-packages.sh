dnf -y install xorg-x11-xauth

cat <<EOF > /etc/yum.repos.d/google.repo
[google-chrome]
name=google-chrome - 64-bit
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF
dnf -y install google-chrome-stable
rm -f /etc/yum.repos.d/google.repo

# mkvtoolnx-gui
# fslint

dnf -y --setopt=install_weak_deps=False --best install openshot
dnf -y install audacity simplescreenrecorder
dnf -y install inkscape gimp sweep totem avidemux mkvtoolnix cmus

dnf -y install gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-ffmpeg

dnf -y install mencoder mplayer ffmpeg
dnf -y install geeqie gthumb shutter gnome-epub-thumbnailer
dnf -y install rdesktop ntfs-3g ntfsprogs
dnf -y install pavucontrol qbittorrent NetworkManager-tui

dnf install ghex tidy units rpl w3m intltool shntool mac lha xkeycaps rpmreaper ranger

# ntop
dnf -y install nmap iotop lshw htop iftop iotop lsof tcpdump sysstat strace vnstat traceroute procps-ng strace
dnf -y install git fdupes screen expect lynx moreutils unrar recode rsync p7zip\* pv


dnf -y install borgbackup
pip3 install borgmatic

dnf -y install keepassxc
dnf -y install yubikey-personalization-gui ykpers

rpm -Uvh https://downloads.rclone.org/v1.53.3/rclone-v1.53.3-linux-amd64.rpm

dnf -y install liferea

