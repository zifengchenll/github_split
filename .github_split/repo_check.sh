#!/bin/bash

# 切换到脚本所在目录
cd "$(dirname "$0")"

# 设置根目录和工作目录
rootdir=$(pwd)
workdir=$rootdir/../

# 查找并打印所有 .git 目录和文件
echo "##################################################"
echo ""
echo "查找到的 .git 目录："
find $workdir -type d -name ".git" | sed "s|$workdir||"
echo ""

echo "查找到的 .git 文件："
find $workdir -type f -name ".git" | sed "s|$workdir||"
echo ""
echo "##################################################"
echo ""

# 查找并打印所有 .gitignore 文件
echo "查找到的 .gitignore 文件："
find $workdir -type f -name ".gitignore" | sed "s|$workdir||"
echo ""
echo "##################################################"
echo ""

# 查找并打印所有大于 100MB 的文件
echo "查找到的大于 100MB 的文件："
find $workdir -type f -size +100M | sed "s|$workdir||"
echo ""
echo "##################################################"
echo ""

# 查找并打印所有空文件夹
echo "查找到的空文件夹："
find $workdir -type d -empty | sed "s|$workdir||"
echo ""
echo "##################################################"
echo ""
