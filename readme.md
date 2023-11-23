### 工具目的：

**解决目前Github平台，单文件大小不能超过100MB以上的问题，在上传前使用工具命令进行分包，从仓库下载后通过命令本地合包，通过这个方法，可以绕过这个限制**


### 工具命令：

```
.
├── file
│   ├── toolchain_gcc_t-head_linux-master.zip_pkg00
│   └── toolchain_gcc_t-head_linux-master.zip_pkg01
├── .github_split
│   ├── split_after.sh		//下载后运行合包，删除小包
│   ├── split_before.sh		//提交前进行分包，生成小包
│   ├── split_log_md5.txt	//自动生成需提交
│   └── split_log.txt		//自动生成需提交
├── license-2.0.txt
└── readme.md

```



### 使用方法：



**提交前原始文件：**

```
.
├── file
│   └── toolchain_gcc_t-head_linux-master.zip
├── .github_split
│   ├── split_after.sh		//下载后运行合包，删除小包
│   ├── split_before.sh		//提交前进行分包，生成小包
│   ├── split_log_md5.txt	//自动生成需提交
│   └── split_log.txt		//自动生成需提交
├── license-2.0.txt
└── readme.md

```
**分包后提交文件：**

```
.
├── file
│   ├── toolchain_gcc_t-head_linux-master.zip_pkg00
│   └── toolchain_gcc_t-head_linux-master.zip_pkg01
├── .github_split
│   ├── split_after.sh		//下载后运行合包，删除小包
│   ├── split_before.sh		//提交前进行分包，生成小包
│   ├── split_log_md5.txt	//自动生成需提交
│   └── split_log.txt		//自动生成需提交
├── license-2.0.txt
└── readme.md

```


```
$ cd .github_split/ && ./split_before.sh	//提交前运行
```

```
$ cd .github_split/ && ./split_after.sh	//下载后运行
```

