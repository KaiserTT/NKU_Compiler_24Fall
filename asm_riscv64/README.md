# 使用说明

## 汇编
在任意linux系统下使用`riscv64-unknown-linux-gnu-gcc [.s文件路径] -o [可执行文件路径] -static`对.s文件进行汇编

## 运行
使用**QEMU**模拟器进行虚仿，输入指令`qemu-riscv64 [可执行文件路径]`运行程序