

/etc/fstab -----------------------------------------------------------
UUID=cab1638a-510f-47bf-9fb1-8f37c9022f82  /          xfs    defaults                        0 0
UUID=3d75c6cc-a9ff-4a14-adb7-b1aa090daeb8  /home      btrfs  defaults,noatime,compress=zstd  0 0
/dev/sda2                                  /mnt/dat0  ext4   defaults                        1 2

mttj@serv1:                /mnt/serv1  fuse.sshfs  defaults,_netdev,identityfile=/home/mttj/.ssh/id_rsa,uid=1000,gid=1000,allow_other  0  0
nas3:/tank2/nobackup/mttj  /mnt/nas3   nfs         defaults,vers=3  0 0
----------------------------------------------------------------------
UUID=a60d246e-1707-4eea-8a96-475b7fef330c  /                      xfs    defaults           0 0
UUID=728e2722-606c-445e-ba64-1418b5142543  /mnt/dat0              xfs    defaults           0 2
UUID=5e2ef3a3-afbc-43d1-9f16-4af70cea68ff  /home                  btrfs  defaults,discard   0 2
----------------------------------------------------------------------


/usr/share/X11/xorg.conf.d/40-libinput.conf

Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection





cat << EOF > /etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
    Identifier  "Intel Graphics" 
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection
EOF

----------------------------------------------------------------------




#dnf copr enable bugzy/lector
#dnf -y install lector

----------------------------------------------------------------------

# dnf -y install borgmatic borgbackup python3-ruamel-yaml python3-pykwalify
# dnf -y install redhat-rpm-config python3-devel
# pip3 install vorta
----------------------------------------------------------------------
rpm -qa --queryformat '%{size} %{name}\n' | sort -rn |less
----------------------------------------------------------------------



https://www.syntevo.com/smartgit/download/


dnf -y install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
reboot







https://megatools.megous.com/
dnf install glib2-devel asciidoc
dnf install g++
dnf install cryptlib-devel.x86_64 cryptlib.x86_64
dnf install libcurl
dnf install libcurl-devel
dnf install cryptlib cryptlib-devel
dnf install glib2-devel
dnf install asciidoc




https://github.com/Amitie10g/MegaFuse
dnf install cryptlib-devel readline-devel ryptopp-devel cryptopp-devel freeimage-devel db4-devel curl-devel libdb-cxx-devel







# lossless video cutter
vidcutter
https://gitlab.gnome.org/YaLTeR/video-trimmer





# video download helper extension
wget https://github.com/mi-g/vdhcoapp/releases/download/v1.3.0/net.downloadhelper.coapp-1.3.0-1_amd64.tar.gz


net.downloadhelper.coapp-1.3.0/bin/net.downloadhelper.coapp-linux-64 install --system
----------------------------------------------------------------------
# lossless video cut
https://github.com/mifi/lossless-cut/releases

# lossless jpeg cut
https://github.com/jepler/cropgui

======================================================================
======================================================================
======================================================================



# rename nic for ease of use
ip link set dev enp0s31f6 name eth0




cat << EOF > /etc/systemd/timesyncd.conf
[Time]
NTP=ntp.compute.dtu.dk
EOF

systemctl start systemd-timesyncd
systemctl enable systemd-timesyncd


echo 'send dhcp-client-identifier = hardware;' > /etc/dhcp/dhclient.conf


dnf install gnome-terminal evince inkscape nautilus
dnf install lightdm

https://askubuntu.com/questions/51086/how-do-i-enable-auto-login-in-lightdm

https://wiki.archlinux.org/index.php/LightDM#Enabling_autologin

dnf -y install lightdm lightdm-gtk
systemctl disable gdm.service
systemctl enable lightdm.service
echo '[Seat:*]'           >> /etc/lightdm/lightdm.conf
echo 'autologin-user=maj' >> /etc/lightdm/lightdm.conf






