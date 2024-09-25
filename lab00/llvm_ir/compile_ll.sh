#!/bin/bash

# 遍历当前目录中的所有 .ll 文件
for file in *.ll
do
    # 去掉文件的扩展名，生成对应的可执行文件名
    output_file="${file%.ll}"

    # 使用 clang 编译 .ll 文件
    echo "Compiling $file to $output_file..."
    clang "$file" -o "$output_file"

    # 检查编译是否成功
    if [ $? -eq 0 ]; then
        echo "Successfully compiled $file to $output_file"
    else
        echo "Failed to compile $file" >&2
    fi
done