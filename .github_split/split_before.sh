#!/bin/bash

# 切换到脚本所在目录并执行 split_after.sh
cd "$(dirname "$0")" && ./split_after.sh

# 清空日志文件
: >split_log.txt
: >split_log_md5.txt

# 设置根目录和工作目录
rootdir=.
workdir=$rootdir/../

# 查找并打印 .git 目录路径
git_paths=$(find $workdir -name ".git")
echo "找到的 .git 目录路径：" >git_paths.txt
for git_path in $git_paths; do
	echo $git_path >>git_paths.txt
done

# 打印调试信息：找到的 .git 目录路径
echo "##################################################"
echo ""
echo "找到的 .git 目录："
cat git_paths.txt
echo ""
echo "##################################################"

# 构建 -path 选项以排除 .git 目录
exclude_paths=""
for git_path in $git_paths; do
	exclude_paths="$exclude_paths -path $git_path -prune -o"
done

# 明确排除工作目录中的 .git
exclude_paths="$exclude_paths -path $workdir.git -prune -o"

# 查找大于 100M 的文件，排除 .git 目录
split_list=$(eval "find $workdir $exclude_paths -type f -size +100M -print")

# 打印调试信息：找到的大文件路径
echo "##################################################"
echo ""
echo "需要拆分的文件："
for split_path in $split_list; do
	echo $split_path
done
echo ""
echo "##################################################"

# 处理找到的大文件
for split_path in $split_list; do
	echo $split_path >>split_log.txt
	echo $(md5sum $split_path) >>split_log_md5.txt

	# 打印调试信息：正在拆分的文件
	echo "##################################################"
	echo ""
	echo "正在拆分文件：$split_path"

	# 将文件拆分为 100M 块并删除原文件
	split -b 100M -d $split_path "${split_path}_pkg" && rm -rf $split_path

	# 打印调试信息：文件拆分完成
	echo "文件拆分完成：$split_path"
	echo ""
	echo "##################################################"
done
