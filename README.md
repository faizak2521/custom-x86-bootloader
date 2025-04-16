# Faiza's Custom Bootloader 💻

This is a handcrafted x86 BIOS bootloader written in NASM. It displays a welcome message, ASCII art, and allows live keyboard input.

## Features
- BIOS teletype printing (`int 0x10`)
- Keyboard input via `int 0x16`
- Fun ASCII heart ♥
- Free typing mode at the end

## How to Run
```bash
nasm -f bin bootloader.asm -o bootloader.bin
dd if=bootloader.bin of=boot.img bs=512 count=1
qemu-system-x86_64 -drive format=raw,file=boot.img
