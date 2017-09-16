echo creatimg myos.bin

make

echo Verifying multiboot

if grub-file --is-x86-multiboot myos.bin; then

	echo multiboot confirmed
else
	echo the file is not multiboot
fi  

echo copying myos.bin into isodir/boot/ 
cp myos.bin isodir/boot/myos.bin
echo copying grub.cfg into isodir/boot/grub/  
cp grub.cfg isodir/boot/grub/grub.cfg
echo creating bootable image 
grub-mkrescue -o myos.iso isodir
echo testing your operating system
qemu-system-i386 -cdrom myos.iso

