#!/bin/bash

# 获取脚本所在目录
script_dir=$(dirname "$0")

# 路径文件
paths_file="$script_dir/paths.txt"

# 读取路径文件并在每个路径中创建 .gitkeep 文件
while IFS= read -r path; do
  # 去掉路径两端的空格
  path=$(echo "$path" | xargs)
  
  # 如果路径不为空则创建目录和 .gitkeep 文件
  if [ -n "$path" ]; then
    mkdir -p "$path"  # 确保路径存在
    touch "$path/.gitkeep"  # 创建 .gitkeep 文件
  fi
done < "$paths_file"

echo "所有路径已成功创建 .gitkeep 文件"

