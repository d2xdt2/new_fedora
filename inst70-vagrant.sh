lscpu | grep Virtualization

dnf -y install vagrant vagrant-sshfs ansible vim-syntastic-ansible
dnf -y install vagrant-digitalocean vagrant-digitalocean-doc
dnf -y install bridge-utils libvirt virt-install qemu-kvm vagrant-libvirt virt-top libguestfs-tools rsync
lsmod | grep kvm

systemctl start libvirtd
systemctl enable libvirtd
systemctl enable --now libvirtd
usermod --append --groups libvirt <USERNAME-HERE>

# Redefine libvirt storage pool path
# Workaround. The storage is still owned as root, which is not ideal.
virsh pool-list
virsh pool-destroy default
virsh pool-undefine default
mkdir /home/libvirt-storage
virsh pool-define-as --name default --type dir --target /home/libvirt-storage
virsh pool-autostart default
virsh pool-start default
virsh pool-list

As root list libvirt networks by virsh net-list.

No need to create a new network bridge. Can just use virbr0. A good how to would however be: https://www.cyberciti.biz/faq/how-to-add-network-bridge-with-nmcli-networkmanager-on-linux/

To list and delete downloaded Vagrant Boxes

virsh vol-list default
virsh vol-delete centos-VAGRANTSLASH-7_vagrant_box_image_1905.1.img default
virsh pool-refresh default



