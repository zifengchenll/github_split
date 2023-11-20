### 工具命令：

```
.
├── split_after.sh		//合包命令，仓库从github下载后，运行脚本进行合包
├── split_before.sh		//分包命令，在提交github的之前，运行脚本进行分包，需要手动将分包后的文件一并提交
```



### 工具目的：

解决目前Github平台，单文件大小不能超过100MB以上的问题（超过100MB大小的文件只能使用LFS存储，但是费用非常高，土豪可以考虑），在上传前使用工具命令进行分包，从仓库下载后通过命令本地合包，通过这个方法，可以绕过这个限制。当然，如果你足够聪明，可以基于这个脚本继续改造，将Github平台做成自己的云盘，TODO



### 使用方法：

```
将本仓库文件夹完整拷贝到需要进行分包传输的仓库根目录，请看实例：假设我有一个仓库，仓库名称：Github_Root

Github_Root/
├── .git
│   ├── branches
│   ├── config
│   ├── description
│   ├── HEAD
│   ├── hooks
│   ├── info
│   ├── objects
│   └── refs
└── github_split
    ├── license-2.0.txt
    ├── readme.md
    ├── split_after.sh
    ├── split_before.sh
    ├── split_log_md5.txt	//分包后，需要提交仓库，合包时使用
    └── split_log.txt		//分包后，需要提交仓库，合包时使用

```

```
$ cd ./github_split/ && ./split_before.sh	//提交前运行
```

```
$ cd ./github_split/ && ./split_after.sh	//下载后运行
```

