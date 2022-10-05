mkdir ./out

nasm -f bin osTest.asm -o ./out/boot.bin
nasm "kernel_entry.asm" -f elf -o "./out/kernel_entry.o"
nasm -f bin zeroes.asm -o ./out/zeroes.bin

i386-elf-gcc -ffreestanding -m32 -g -c "kernel.cpp" -o "./out/kernel.o"
i386-elf-ld -o "./out/full_kernel.bin" -Ttext 0x1000 "./out/kernel_entry.o" "./out/kernel.o" --oformat binary

cat "./out/boot.bin" "./out/full_kernel.bin" > "./out/everything.bin"
cat "./out/everything.bin" "./out/zeroes.bin" > "OS.bin"