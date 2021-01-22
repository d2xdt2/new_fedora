perl -i -lape 's/^SELINUX=\K.*/disabled/' /etc/selinux/config


sed -i 's/ rhgb//g' /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg

sed -i 's/installonly_limit=3/installonly_limit=2/' /etc/dnf/dnf.conf

dnf remove gnome-backgrounds nautilus-sendto bash-completion foomatic\* graphviz gnome-getting-started-docs evolution gnome-user-docs bzr mercurial rhythmbox texlive-base oxygen-icon-theme libpinyin-data webkitgtk4-plugin-process-gtk2 hplip geolite\* flatpak open-vm\* sane-backends-drivers-cameras sane-backends-drivers-scanners gnome-weather fedora-workstation-backgrounds orca sane-backends-drivers-scanners gnome-calculator httpd ModemManager gnome-clocks xorg-x11-drv-wacom gutenprint-cups gnome-font-viewer python-systemd-doc hplip-common cups-filters bind-libs sane-airscan

dnf remove gnome-software PackageKit\*
rm -rf /var/cache/PackageKit

dnf update

dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf -y install zsh

dnf -y install i3 dmenu
dnf copr enable -y gregw/i3desktop
dnf -y install flameshot i3lock
dnf -y copr enable vladius/i3blocks
dnf -y install i3blocks

gsettings set org.gnome.nautilus.preferences open-folder-on-dnd-hover false
dconf write /org/gnome/desktop/sound/event-sounds "false"

# Disable Nautilus from making default directories
echo "enabled=False" >> ~/.config/user-dirs.conf

# disable beep in programs such as gedit when keep Arrow Down pressed
xset -b
rmmod pcspkr
modprobe -r pcspkr

dconf write /org/gnome/desktop/sound/event-sounds "false"
gsettings set org.gnome.desktop.wm.preferences audible-bell false

cat <<END >>/etc/modprobe.d/blacklist
blacklist pcspkr
blacklist snd_pcsp
END

cat <<EOF > /usr/lib/systemd/system-sleep/xmodmap.sh
#!/bin/bash
if [ "$1" = "post" ] ; then
    typeset -x DISPLAY=:0.0
    # sleep 1
    su -c "/usr/bin/xmodmap ~/.Xmodmap" a
fi
EOF
chmod 755 /usr/lib/systemd/system-sleep/xmodmap.sh

at <<EOF > /etc/rc.d/rc.local
#!/bin/sh
loadkeys /home/a/.textmode.map
exit 0
EOF
chmod 755 /etc/rc.d/rc.local
systemctl enable rc-local
systemctl start  rc-local

dnf -y install augeas
augtool --autosave --noautoload --transform "ssh incl /etc/ssh/ssh_config" set "/files/etc/ssh/ssh_config/ForwardX11" yes
augtool --autosave --noautoload --transform "ssh incl /etc/ssh/ssh_config" set "/files/etc/ssh/ssh_config/ServerAliveInterval" 60

sed -i 's/#SystemMaxFileSize=/SystemMaxFileSize=10/g' /etc/systemd/journald.conf
sed -i 's/#SystemMaxFileSize=/SystemMaxFileSize=10/g' /etc/systemd/journald.conf
sed -i 's/#SystemMaxFiles=100/SystemMaxFiles=10/g' /etc/systemd/journald.conf
sed -i 's/#RuntimeMaxUse=/RuntimeMaxUse=10/g' /etc/systemd/journald.conf
sed -i 's/#RuntimeMaxFileSize=/RuntimeMaxFileSize=10/g' /etc/systemd/journald.conf
sed -i 's/#RuntimeMaxFiles=100/RuntimeMaxFiles=10/g' /etc/systemd/journald.conf
journalctl --vacuum-time=1seconds

systemctl enable sshd
systemctl start sshd

firewall-cmd --permanent --zone=public --add-port=60853/tcp
firewall-cmd --permanent --zone=public --add-port=60853/udp
firewall-cmd --zone=public --permanent --add-service=transmission-client
firewall-cmd --reload

systemctl disable cups.service
systemctl disable spice-vdagentd.service
#systemctl disable libvirtd.service
systemctl disable lvm2-monitor.service
systemctl disable mdmonitor.service
systemctl disable vmtoolsd.service
systemctl disable nfs-lock.service
systemctl disable dmraid-activation.service
systemctl disable bluetooth.service
systemctl disable iscsi.service
systemctl disable ModemManager.service
systemctl disable vboxservice.service

systemctl list-unit-files --type=service|grep enabled




