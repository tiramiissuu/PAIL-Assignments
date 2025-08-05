Assignment 1 - Lab 1

---

The assignment has 3 parts:
1. Hello World – An assembly program that prints "Hello, World!".
2. GDB use – Running GDB to debug the program.
3. Print Name & Surname – Prints my name on the first line and my surname on the second line.

---

To build and run (32-bit NASM)
```bash
nasm -f elf32 <program_name>.asm -o <program_name>.o
ld -m elf_i386 <program_name>.o -o <program_name>
./<program_name>
```

---

To debug

```bash
nasm -f elf32 -g <program_name>.asm -o <program_name>.o
ld -m elf_i386 <program_name>.o -o <program_name>
./<program_name>
```
```bash
gdb ./<program_name>
(gdb) break _start
(gdb) run
(gdb) set disassembly-flavor intel
(gdb) disassemble _start
(gdb) layout asm
(gdb) layout regs
(gdb) nexti
(gdb) quit
```
