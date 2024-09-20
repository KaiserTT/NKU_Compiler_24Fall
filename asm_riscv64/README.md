# 使用说明

## 汇编
在任意linux系统下使用`riscv64-unknown-linux-gnu-gcc [.s文件路径] -o [可执行文件路径] -static`对.s文件进行汇编

## 运行
使用**QEMU**模拟器进行虚仿，输入指令`qemu-riscv64 [可执行文件路径]`运行程序

# 代码目录
1. `hello_world.s`：实现了打印"Hello Compiler"的功能
2. `factorial.s`：实现了接收用户输入，输出阶乘的功能
3. `fibonacci.s`：实现了接收用户输入迭代次数，输出Fibonacci数列结果的功能