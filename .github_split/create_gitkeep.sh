#!/bin/bash

# 路径文件
paths_file="paths.txt"

# 读取路径文件并在每个路径中创建 .gitkeep 文件
while IFS= read -r path; do
  mkdir -p "$path"  # 确保路径存在
  touch "$path/.gitkeep"  # 创建 .gitkeep 文件
done < "$paths_file"

echo "所有路径已成功创建 .gitkeep 文件"

