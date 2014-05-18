clear
shopt -s expand_aliases
set -o nounset
set_env(){
dir_tmp=TMP
file_type=qcow2
file_virt_disk=$dir_tmp/virt_disk.img
size_disk=1
device=/dev/sdb
file_iso=$dir_tmp/arch_linux.iso
memory=1024
}
set_env
type set_env | tail -n +2


alias step1="qemu-img create -f $file_type $file_virt_disk ${size_disk}G"
alias step2="qemu -m $memory -hda $file_virt_disk -cdrom $file_iso -boot d"
alias step3="qemu -m $memory -hda $file_virt_disk -cdrom $device -boot d"

#If you are running an x86-64 Linux (i.e. 64-bit), you will need to run the x86-64 version of QEMU to be able to utilise kqemu:
alias step5="qemu-system-x86_64 -m $memory -hda $file_virt_disk -cdrom $device -kernel-kqemu"

file_self=${BASH_SOURCE:-$0}
cat $file_self | grep step | grep -v grep
set +u
