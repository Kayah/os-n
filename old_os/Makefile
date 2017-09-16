CC = i686-elf-gcc
AS = i686-elf-as
CFLAGS = -O2 -std=gnu99 -ffreestanding -Wall -Wextra
LIBS = -lgcc

myos:  linker.ld boot.o kernel.o
	$(CC) -T $< -o $@.bin -ffreestanding -O2 boot.o kernel.o $(LIBS) -nostdlib

boot: boot.s
	$(AS) $? -o $@.o

kernel: kernel.c
	$(CC) $? -c -o $@.o $(CFLAGS)

.PHONY: clean


clean:
	rm -rf *.o
