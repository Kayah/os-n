#Constants for the multiboot header
.set ALIGN,	1<<0			#align loaded modules on page boundaries
.set MEMINFO,	1<<1			#provide memory map
.set FLAGS,	ALIGN | MEMINFO 	#Multiboot flag field
.set MAGIC,	0x1BADB002		#lets bootloader find the header
.set CHECKSUM,	-(MAGIC + FLAGS)	#checksum of above, to prove it is multiboot

#Multiboot header, marks the program as a kernel
.section .multiboot
.align	4
.long	MAGIC
.long	FLAGS
.long	CHECKSUM

.section .bss
.align 16

stack_bottom:
.skip 16384
stack_top:

.section .text
.global _start
.type _start, @function
_start:
	mov $stack_top, %esp
	call kernel_main
	cli
1:	hlt	
	jmp 1b



.size _start, . - _start
	
